#pragma once

#include "aimrt_module_cpp_interface/module_base.h"
#include "aimrt_module_cpp_interface/co/aimrt_context.h"
#include "aimrt_module_cpp_interface/co/async_scope.h"
#include "aimrt_module_cpp_interface/co/inline_scheduler.h"
#include "aimrt_module_cpp_interface/co/on.h"
#include "aimrt_module_cpp_interface/co/schedule.h"
#include "aimrt_module_cpp_interface/co/sync_wait.h"
#include "aimrt_module_cpp_interface/co/task.h"
namespace aimrt::examples::cpp::LearnAimRT {

class ExecutorCoModule : public aimrt::ModuleBase {
public:
  ExecutorCoModule() = default;
  ~ExecutorCoModule() override = default;

  aimrt::ModuleInfo Info() const override {
    return aimrt::ModuleInfo{.name = "ExecutorCoModule"};
  }

  bool Initialize(aimrt::CoreRef core) override;

  bool Start() override;

  void Shutdown() override;


private:
  aimrt::executor::ExecutorRef thread_safe_executor_;
  aimrt::co::AsyncScope scope_;
  aimrt::co::Task<void> SimpleExecuteDemo();

private:
  auto GetLogger() { return core_.GetLogger(); }

private:
  aimrt::CoreRef core_;
};

}
