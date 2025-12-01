//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <connectivity_plus/connectivity_plus_windows_plugin.h>
#include <desktop_window/desktop_window_plugin.h>
#include <flutter_core/flutter_core_plugin_c_api.h>
#include <flutter_localization/flutter_localization_plugin_c_api.h>
#include <flutter_ui_base/flutter_ui_base_plugin_c_api.h>
#include <my_localizations/my_localizations_plugin_c_api.h>
#include <my_logger_metrics/my_logger_metrics_plugin_c_api.h>
#include <my_theme_style/my_theme_style_plugin_c_api.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ConnectivityPlusWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ConnectivityPlusWindowsPlugin"));
  DesktopWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DesktopWindowPlugin"));
  FlutterCorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterCorePluginCApi"));
  FlutterLocalizationPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterLocalizationPluginCApi"));
  FlutterUiBasePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterUiBasePluginCApi"));
  MyLocalizationsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MyLocalizationsPluginCApi"));
  MyLoggerMetricsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MyLoggerMetricsPluginCApi"));
  MyThemeStylePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MyThemeStylePluginCApi"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
