#include "hello/MyNormalChannel_module.h"

namespace aimrt::examples::cpp::LearnAimRT {

aimrt::co::Task<void> MyNormalChannelModule::MainLoop() {
  AIMRT_INFO("Start MainLoop.");
  aimrt::co::AimRTScheduler work_thread_pool_scheduler(executor_);
  uint32_t count = 0;
  while (run_flag_) {
    // 1s 执行一次
    co_await aimrt::co::ScheduleAfter(work_thread_pool_scheduler,
                                      std::chrono::milliseconds(1000));
    // 发布topic
    my_channel::proto::StringMsg msg;
    msg.set_msg("count: " + std::to_string(count));

    AIMRT_INFO("Publish new pb event, data: {}", aimrt::Pb2CompactJson(msg));
    aimrt::channel::Publish(publisher_, msg);
  }

  AIMRT_INFO("Exit MainLoop.");
  co_return;
}

void MyNormalChannelModule::DataCallback(const std::shared_ptr<const my_channel::proto::StringMsg>& data){
  AIMRT_INFO("Receive new pb event, data: {}", aimrt::Pb2CompactJson(*data));
}

bool MyNormalChannelModule::Initialize(aimrt::CoreRef core){
  core_ = core;
  // 初始化执行器
  executor_ = core_.GetExecutorManager().GetExecutor("work_thread_pool");
  // 初始化发布者
  publisher_ = core_.GetChannelHandle().GetPublisher("test_topic");
  // 注册发布者类型
  aimrt::channel::RegisterPublishType<my_channel::proto::StringMsg>(
      publisher_);
  // 初始化订阅者
  subscriber_ = core_.GetChannelHandle().GetSubscriber("test_topic");
  // 订阅topic 并指明回调函数
  aimrt::channel::Subscribe<my_channel::proto::StringMsg>(
      subscriber_, std::bind(&MyNormalChannelModule::DataCallback, this,
                             std::placeholders::_1));
  AIMRT_INFO("Init succeeded.");
  return true;
}

bool MyNormalChannelModule::Start(){
  AIMRT_INFO("Start succeeded.");
  scope_.spawn(aimrt::co::On(aimrt::co::InlineScheduler(), MainLoop()));
  return true;
}

void MyNormalChannelModule::Shutdown(){
  run_flag_ = false;
  aimrt::co::SyncWait(scope_.complete());
  AIMRT_INFO("Shutdown succeeded.");
}









}