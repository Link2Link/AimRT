#include "hello/ExecutorCo_module.h"


namespace aimrt::examples::cpp::LearnAimRT {

bool ExecutorCoModule::Initialize(aimrt::CoreRef core) {
  core_ = core;
  // 初始化执行器 需要传入执行器的名称
  thread_safe_executor_ =
      core_.GetExecutorManager().GetExecutor("thread_safe_executor");

  // 检查执行器是否为线程安全的
  AIMRT_CHECK_ERROR_THROW(thread_safe_executor_.ThreadSafe(),
                          "the executor must be thread safe!");

  AIMRT_INFO("Init succeeded.");

  return true;

}

bool ExecutorCoModule::Start(){
  AIMRT_INFO("Start succeeded.");
  // 原地开启协程任务
  scope_.spawn(
      aimrt::co::On(aimrt::co::InlineScheduler(), SimpleExecuteDemo()));

  return true;
}

void ExecutorCoModule::Shutdown() {
  AIMRT_INFO("Shutdown succeeded.");
}

aimrt::co::Task<void> ExecutorCoModule::SimpleExecuteDemo(){
  aimrt::co::AimRTScheduler thread_safe_scheduler(thread_safe_executor_);
  // 调度协程至当前执行器
  co_await aimrt::co::Schedule(thread_safe_scheduler);

  uint32_t n = 0;
  auto task = [&n]() -> aimrt::co::Task<void> {
    n++;
    co_return;
  };

  aimrt::co::AsyncScope scope;
  for (int i = 0; i < 100; i++) {
    scope.spawn(aimrt::co::On(thread_safe_scheduler, task()));
  }
  co_await aimrt::co::On(aimrt::co::InlineScheduler(), scope.complete());
  AIMRT_INFO("Value of n is {}", n);
  co_return;

}





}