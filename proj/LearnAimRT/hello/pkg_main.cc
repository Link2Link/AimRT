// Copyright (c) 2023, AgiBot Inc.
// All rights reserved.

#include "aimrt_pkg_c_interface/pkg_macro.h"
#include "hello/hello_module.h"
#include "hello/ExecutorCo_module.h"
#include "hello/MyNormalChannel_module.h"


static std::tuple<std::string_view, std::function<aimrt::ModuleBase*()>> aimrt_module_register_array[]{
  {"HelloModule", []() -> aimrt::ModuleBase* { return new aimrt::examples::cpp::LearnAimRT::HelloModule();}},
  {"ExecutorCoModule", []() -> aimrt::ModuleBase* { return new aimrt::examples::cpp::LearnAimRT::ExecutorCoModule();}},
  {"MyNormalChannelModule", []() -> aimrt::ModuleBase* { return new aimrt::examples::cpp::LearnAimRT::MyNormalChannelModule();}},
};

AIMRT_PKG_MAIN(aimrt_module_register_array)


