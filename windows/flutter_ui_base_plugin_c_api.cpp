#include "include/flutter_ui_base/flutter_ui_base_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_ui_base_plugin.h"

void FlutterUiBasePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_ui_base::FlutterUiBasePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
