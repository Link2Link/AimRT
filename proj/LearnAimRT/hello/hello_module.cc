// Copyright (c) 2023, AgiBot Inc.
// All rights reserved.

#include "hello/hello_module.h"

#include "yaml-cpp/yaml.h"

namespace aimrt::examples::cpp::LearnAimRT {

bool HelloModule::Initialize(aimrt::CoreRef core) {
  // Save aimrt framework handle
  core_ = core;

  // Read cfg
  auto file_path = core_.GetConfigurator().GetConfigFilePath();
  if (!file_path.empty()) {
    AIMRT_INFO("This is module init");
    AIMRT_INFO("Module name : {}", Info().name);
    AIMRT_INFO("file path = {}", file_path);

    YAML::Node cfg_node = YAML::LoadFile(std::string(file_path));
    for (const auto& itr : cfg_node) {
      std::string k = itr.first.as<std::string>();
      std::string v = itr.second.as<std::string>();
      AIMRT_INFO("cfg [{} : {}]", k, v);
    }
  }

  AIMRT_INFO("Init succeeded.");

  return true;
}

bool HelloModule::Start() {
  AIMRT_INFO("Start succeeded.");

  AIMRT_INFO("This is HelloModule Start");
  return true;
}

void HelloModule::Shutdown() {
  AIMRT_INFO("Shutdown succeeded.");
}

}
