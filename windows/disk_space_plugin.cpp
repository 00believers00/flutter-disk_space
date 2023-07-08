#include "disk_space_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

#include <stdio.h>
#include <iostream>
#include <string>
#include <array>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>


namespace disk_space {
std::string exec(const char* cmd) {
    std::array<char, 128> buffer;
    std::string result;
    std::shared_ptr<FILE> pipe(_popen(cmd, "r"), _pclose);
    if (!pipe) throw std::runtime_error("_popen() failed!");
    while (!feof(pipe.get())) {
        if (fgets(buffer.data(), 128, pipe.get()) != NULL)
            result += buffer.data();
    }
    return result;
}
// static
void DiskSpacePlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "disk_space",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<DiskSpacePlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

DiskSpacePlugin::DiskSpacePlugin() {}

DiskSpacePlugin::~DiskSpacePlugin() {}



void DiskSpacePlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
   if (method_call.method_name().compare("getSerialNumber") == 0) {
   std::string serial_number;
   serial_number = exec("wmic path win32_physicalmedia get SerialNumber");
   result->Success(flutter::EncodableValue(serial_number));
   std::cin.clear();
   std::cin.ignore(2);
  } else {
    result->NotImplemented();
  }
}



}  // namespace disk_space
