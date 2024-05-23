#include "include/distributions/distributions_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "distributions_plugin.h"

void DistributionsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  distributions::DistributionsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
