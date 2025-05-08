#!/bin/bash

# exit on error and print each command
set -e

if [ -d ./build/install ]; then
    rm -rf ./build/install
fi

# 最小化构建
# cmake -B build \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DAIMRT_INSTALL=ON \
#     -DCMAKE_INSTALL_PREFIX=./build/install \
#     -DAIMRT_BUILD_TESTS=OFF \
#     -DAIMRT_BUILD_EXAMPLES=ON \
#     -DAIMRT_BUILD_DOCUMENT=OFF \
#     -DAIMRT_BUILD_RUNTIME=ON \
#     -DAIMRT_BUILD_CLI_TOOLS=OFF \
#     -DAIMRT_BUILD_PYTHON_RUNTIME=OFF \
#     -DAIMRT_USE_FMT_LIB=ON \
#     -DAIMRT_BUILD_WITH_PROTOBUF=ON \
#     -DAIMRT_USE_LOCAL_PROTOC_COMPILER=OFF \
#     -DAIMRT_USE_PROTOC_PYTHON_PLUGIN=OFF \
#     -DAIMRT_BUILD_WITH_ROS2=OFF \
#     -DAIMRT_BUILD_NET_PLUGIN=ON \
#     -DAIMRT_BUILD_MQTT_PLUGIN=OFF \
#     -DAIMRT_BUILD_ZENOH_PLUGIN=OFF \
#     -DAIMRT_BUILD_ICEORYX_PLUGIN=OFF \
#     -DAIMRT_BUILD_ROS2_PLUGIN=OFF \
#     -DAIMRT_BUILD_RECORD_PLAYBACK_PLUGIN=ON \
#     -DAIMRT_BUILD_TIME_MANIPULATOR_PLUGIN=ON \
#     -DAIMRT_BUILD_PARAMETER_PLUGIN=ON \
#     -DAIMRT_BUILD_LOG_CONTROL_PLUGIN=ON \
#     -DAIMRT_BUILD_TOPIC_LOGGER_PLUGIN=ON \
#     -DAIMRT_BUILD_OPENTELEMETRY_PLUGIN=ON \
#     -DAIMRT_BUILD_GRPC_PLUGIN=ON \
#     -DAIMRT_BUILD_PYTHON_PACKAGE=OFF \
#     -Dasio_LOCAL_SOURCE=/home/llx/AimRT_dep/asio-asio-1-30-2 \
#     -Dboost_LOCAL_SOURCE=/home/llx/AimRT_dep/boost-1.82.0 \
#     -Dcpptoml_LOCAL_SOURCE=/home/llx/AimRT_dep/cpptoml-v0.1.0 \
#     -Dfmt_LOCAL_SOURCE=/home/llx/AimRT_dep/fmt-10.2.1 \
#     -Dgflags_LOCAL_SOURCE=/home/llx/AimRT_dep/gflags-v2.2.2 \
#     -Dgoogletest_LOCAL_SOURCE=/home/llx/AimRT_dep/googletest-v1.13.0 \
#     -Diceoryx_LOCAL_SOURCE=/home/llx/AimRT_dep/iceoryx-v2.95.4 \
#     -Djsoncpp_LOCAL_SOURCE=/home/llx/AimRT_dep/jsoncpp-1.9.6 \
#     -Dlibunifex_LOCAL_SOURCE=/home/llx/AimRT_dep/libunifex-591ec09e7d51858ad05be979d4034574215f5971 \
#     -Dmcap_LOCAL_SOURCE=/home/llx/AimRT_dep/mcap-releases-cpp-v2.0.0 \
#     -Dzstd_LOCAL_SOURCE=/home/llx/AimRT_dep/facebook-zstd-v1.5.7 \
#     -Dlz4_LOCAL_SOURCE=/home/llx/AimRT_dep/LZ4_old1-v1.10.0 \
#     -Dnghttp2_LOCAL_SOURCE=/home/llx/AimRT_dep/nghttp2-v1.62.1 \
#     -Dnlohmann_json_LOCAL_SOURCE=/home/llx/AimRT_dep/json-v3.11.3 \
#     -Dopentelemetry_cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-cpp-v1.16.1 \
#     -Dopentelemetry_proto_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-proto-v1.3.2 \
#     -Dpaho_mqtt_c_LOCAL_SOURCE=/home/llx/AimRT_dep/paho.mqtt.c-v1.3.13 \
#     -Dprotobuf_LOCAL_SOURCE=/home/llx/AimRT_dep/protobufsource-v3.21.12 \
#     -Dpybind11_LOCAL_SOURCE=/home/llx/AimRT_dep/pybind11-v2.13.1 \
#     -Dstdexec_LOCAL_SOURCE=/home/llx/AimRT_dep/stdexec-nvhpc-23.09.rc4 \
#     -Dtbb_LOCAL_SOURCE=/home/llx/AimRT_dep/tbb-v2021.13.0 \
#     -Dyaml-cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/yaml-cpp-0.8.0 \
#     -Dzenohc_LOCAL_SOURCE=/home/llx/AimRT_dep/zenoh-c-1.0.0.11 \
#     $@

cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DAIMRT_INSTALL=ON \
    -DCMAKE_INSTALL_PREFIX=/usr/AimRT \
    -DAIMRT_BUILD_TESTS=OFF \
    -DAIMRT_BUILD_EXAMPLES=ON \
    -DAIMRT_BUILD_DOCUMENT=ON \
    -DAIMRT_BUILD_RUNTIME=ON \
    -DAIMRT_BUILD_CLI_TOOLS=ON \
    -DAIMRT_BUILD_PYTHON_RUNTIME=ON \
    -DAIMRT_USE_FMT_LIB=ON \
    -DAIMRT_BUILD_WITH_PROTOBUF=ON \
    -DAIMRT_USE_LOCAL_PROTOC_COMPILER=OFF \
    -DAIMRT_USE_PROTOC_PYTHON_PLUGIN=OFF \
    -DAIMRT_BUILD_WITH_ROS2=OFF \
    -DAIMRT_BUILD_NET_PLUGIN=ON \
    -DAIMRT_BUILD_MQTT_PLUGIN=ON \
    -DAIMRT_BUILD_ZENOH_PLUGIN=OFF \
    -DAIMRT_BUILD_ICEORYX_PLUGIN=ON \
    -DAIMRT_BUILD_ROS2_PLUGIN=OFF \
    -DAIMRT_BUILD_RECORD_PLAYBACK_PLUGIN=ON \
    -DAIMRT_BUILD_TIME_MANIPULATOR_PLUGIN=ON \
    -DAIMRT_BUILD_PARAMETER_PLUGIN=ON \
    -DAIMRT_BUILD_LOG_CONTROL_PLUGIN=ON \
    -DAIMRT_BUILD_TOPIC_LOGGER_PLUGIN=ON \
    -DAIMRT_BUILD_OPENTELEMETRY_PLUGIN=ON \
    -DAIMRT_BUILD_GRPC_PLUGIN=ON \
    -DAIMRT_BUILD_PYTHON_PACKAGE=OFF \
    -Dasio_LOCAL_SOURCE=/home/llx/AimRT_dep/asio-asio-1-30-2 \
    -Dboost_LOCAL_SOURCE=/home/llx/AimRT_dep/boost-1.82.0 \
    -Dcpptoml_LOCAL_SOURCE=/home/llx/AimRT_dep/cpptoml-v0.1.0 \
    -Dfmt_LOCAL_SOURCE=/home/llx/AimRT_dep/fmt-10.2.1 \
    -Dgflags_LOCAL_SOURCE=/home/llx/AimRT_dep/gflags-v2.2.2 \
    -Dgoogletest_LOCAL_SOURCE=/home/llx/AimRT_dep/googletest-v1.13.0 \
    -Diceoryx_LOCAL_SOURCE=/home/llx/AimRT_dep/iceoryx-v2.95.4 \
    -Djsoncpp_LOCAL_SOURCE=/home/llx/AimRT_dep/jsoncpp-1.9.6 \
    -Dlibunifex_LOCAL_SOURCE=/home/llx/AimRT_dep/libunifex-591ec09e7d51858ad05be979d4034574215f5971 \
    -Dmcap_LOCAL_SOURCE=/home/llx/AimRT_dep/mcap-releases-cpp-v2.0.0 \
    -Dzstd_LOCAL_SOURCE=/home/llx/AimRT_dep/facebook-zstd-v1.5.7 \
    -Dlz4_LOCAL_SOURCE=/home/llx/AimRT_dep/LZ4_old1-v1.10.0 \
    -Dnghttp2_LOCAL_SOURCE=/home/llx/AimRT_dep/nghttp2-v1.62.1 \
    -Dnlohmann_json_LOCAL_SOURCE=/home/llx/AimRT_dep/json-v3.11.3 \
    -Dopentelemetry_cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-cpp-v1.16.1 \
    -Dopentelemetry_proto_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-proto-v1.3.2 \
    -Dpaho_mqtt_c_LOCAL_SOURCE=/home/llx/AimRT_dep/paho.mqtt.c-v1.3.13 \
    -Dprotobuf_LOCAL_SOURCE=/home/llx/AimRT_dep/protobufsource-v3.21.12 \
    -Dpybind11_LOCAL_SOURCE=/home/llx/AimRT_dep/pybind11-v2.13.1 \
    -Dstdexec_LOCAL_SOURCE=/home/llx/AimRT_dep/stdexec-nvhpc-23.09.rc4 \
    -Dtbb_LOCAL_SOURCE=/home/llx/AimRT_dep/tbb-v2021.13.0 \
    -Dyaml-cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/yaml-cpp-0.8.0 \
    -Dzenohc_LOCAL_SOURCE=/home/llx/AimRT_dep/zenoh-c-1.0.0.11 \
    $@

# cmake -B build \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DAIMRT_INSTALL=ON \
#     -DCMAKE_INSTALL_PREFIX=/usr/AimRT \
#     -DAIMRT_BUILD_TESTS=OFF \
#     -DAIMRT_BUILD_EXAMPLES=ON \
#     -DAIMRT_BUILD_DOCUMENT=ON \
#     -DAIMRT_BUILD_PROTOCOLS=ON \
#     -DAIMRT_BUILD_RUNTIME=ON \
#     -DAIMRT_BUILD_CLI_TOOLS=ON \
#     -DAIMRT_BUILD_PYTHON_RUNTIME=ON \
#     -DAIMRT_USE_FMT_LIB=ON \
#     -DAIMRT_BUILD_WITH_PROTOBUF=ON \
#     -DAIMRT_USE_LOCAL_PROTOC_COMPILER=OFF \
#     -DAIMRT_USE_PROTOC_PYTHON_PLUGIN=OFF \
#     -DAIMRT_BUILD_WITH_ROS2=OFF \
#     -DAIMRT_BUILD_NET_PLUGIN=ON \
#     -DAIMRT_BUILD_MQTT_PLUGIN=ON \
#     -DAIMRT_BUILD_ZENOH_PLUGIN=ON \
#     -DAIMRT_BUILD_ICEORYX_PLUGIN=ON \
#     -DAIMRT_BUILD_ROS2_PLUGIN=OFF \
#     -DAIMRT_BUILD_RECORD_PLAYBACK_PLUGIN=ON \
#     -DAIMRT_BUILD_TIME_MANIPULATOR_PLUGIN=ON \
#     -DAIMRT_BUILD_PARAMETER_PLUGIN=ON \
#     -DAIMRT_BUILD_LOG_CONTROL_PLUGIN=ON \
#     -DAIMRT_BUILD_TOPIC_LOGGER_PLUGIN=ON \
#     -DAIMRT_BUILD_OPENTELEMETRY_PLUGIN=ON \
#     -DAIMRT_BUILD_GRPC_PLUGIN=ON \
#     -DAIMRT_BUILD_ECHO_PLUGIN=ON \
#     -DAIMRT_BUILD_PROXY_PLUGIN=ON \
#     -DAIMRT_BUILD_PYTHON_PACKAGE=ON \
#     -Dasio_LOCAL_SOURCE=/home/llx/AimRT_dep/asio-asio-1-30-2 \
#     -Dboost_LOCAL_SOURCE=/home/llx/AimRT_dep/boost-1.82.0 \
#     -Dcpptoml_LOCAL_SOURCE=/home/llx/AimRT_dep/cpptoml-v0.1.0 \
#     -Dfmt_LOCAL_SOURCE=/home/llx/AimRT_dep/fmt-10.2.1 \
#     -Dgflags_LOCAL_SOURCE=/home/llx/AimRT_dep/gflags-v2.2.2 \
#     -Dgoogletest_LOCAL_SOURCE=/home/llx/AimRT_dep/googletest-v1.13.0 \
#     -Diceoryx_LOCAL_SOURCE=/home/llx/AimRT_dep/iceoryx-v2.95.4 \
#     -Djsoncpp_LOCAL_SOURCE=/home/llx/AimRT_dep/jsoncpp-1.9.6 \
#     -Dlibunifex_LOCAL_SOURCE=/home/llx/AimRT_dep/libunifex-591ec09e7d51858ad05be979d4034574215f5971 \
#     -Dmcap_LOCAL_SOURCE=/home/llx/AimRT_dep/mcap-releases-cpp-v2.0.0 \
#     -Dzstd_LOCAL_SOURCE=/home/llx/AimRT_dep/facebook-zstd-v1.5.7 \
#     -Dlz4_LOCAL_SOURCE=/home/llx/AimRT_dep/LZ4_old1-v1.10.0 \
#     -Dnghttp2_LOCAL_SOURCE=/home/llx/AimRT_dep/nghttp2-v1.62.1 \
#     -Dnlohmann_json_LOCAL_SOURCE=/home/llx/AimRT_dep/json-v3.11.3 \
#     -Dopentelemetry_cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-cpp-v1.16.1 \
#     -Dopentelemetry_proto_LOCAL_SOURCE=/home/llx/AimRT_dep/opentelemetry-proto-v1.3.2 \
#     -Dpaho_mqtt_c_LOCAL_SOURCE=/home/llx/AimRT_dep/paho.mqtt.c-v1.3.13 \
#     -Dprotobuf_LOCAL_SOURCE=/home/llx/AimRT_dep/protobufsource-v3.21.12 \
#     -Dpybind11_LOCAL_SOURCE=/home/llx/AimRT_dep/pybind11-v2.13.1 \
#     -Dstdexec_LOCAL_SOURCE=/home/llx/AimRT_dep/stdexec-nvhpc-23.09.rc4 \
#     -Dtbb_LOCAL_SOURCE=/home/llx/AimRT_dep/tbb-v2021.13.0 \
#     -Dyaml-cpp_LOCAL_SOURCE=/home/llx/AimRT_dep/yaml-cpp-0.8.0 \
#     -Dzenohc_LOCAL_SOURCE=/home/llx/AimRT_dep/zenoh-c-1.0.0.11 \
#     $@


cmake --build build --config Release --target install --parallel $(nproc)
