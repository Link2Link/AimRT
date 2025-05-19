#pragma once

#include "aimrt_module_cpp_interface/module_base.h"

namespace aimrt::examples::cpp::LearnAimRT {

class HelloModule : public aimrt::ModuleBase {
public:
  HelloModule() = default;
  ~HelloModule() override = default;

  ModuleInfo Info() const override {
    return ModuleInfo{.name = "HelloModule"};
  }

  bool Initialize(aimrt::CoreRef core) override;

  bool Start() override;

  void Shutdown() override;

private:
  auto GetLogger() { return core_.GetLogger(); }

private:
  aimrt::CoreRef core_;
};

}
