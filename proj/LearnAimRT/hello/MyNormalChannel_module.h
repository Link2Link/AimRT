#pragma once

#include "aimrt_module_cpp_interface/module_base.h"
#include "aimrt_module_cpp_interface/co/aimrt_context.h"
#include "aimrt_module_cpp_interface/co/async_scope.h"
#include "aimrt_module_cpp_interface/co/inline_scheduler.h"
#include "aimrt_module_cpp_interface/co/schedule.h"
#include "aimrt_module_cpp_interface/co/task.h"
#include "aimrt_module_cpp_interface/module_base.h"
#include "aimrt_module_cpp_interface/co/sync_wait.h"

#include "core/aimrt_core.h"
#include <csignal>
#include <iostream>

#include "aimrt_module_protobuf_interface/channel/protobuf_channel.h"
#include "aimrt_module_protobuf_interface/util/protobuf_tools.h"
#include "string_msg.pb.h"

namespace aimrt::examples::cpp::LearnAimRT {

class MyNormalChannelModule : public aimrt::ModuleBase {
public:
  MyNormalChannelModule() = default;
  ~MyNormalChannelModule() override = default;

  aimrt::ModuleInfo Info() const override {
    return aimrt::ModuleInfo{.name = "MyNormalChannelModule"};
  }

  bool Initialize(aimrt::CoreRef core) override;

  bool Start() override;

  void Shutdown() override;

private:
  aimrt::executor::ExecutorRef executor_;
  aimrt::co::AsyncScope scope_;
  std::atomic_bool run_flag_ = true;
  // 发布者
  aimrt::channel::PublisherRef publisher_;
  // 订阅者
  aimrt::channel::SubscriberRef subscriber_;

  aimrt::co::Task<void> MainLoop();
  void DataCallback(const std::shared_ptr<const my_channel::proto::StringMsg> &data);
private:
  auto GetLogger() { return core_.GetLogger(); }
  aimrt::CoreRef core_;
};

}
