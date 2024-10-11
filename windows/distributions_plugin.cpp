#include "distributions_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>
#include <boost/math/distributions/fisher_f.hpp>
#include <boost/math/distributions/students_t.hpp>

namespace distributions
{

  // static
  void DistributionsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "distributions",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<DistributionsPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  DistributionsPlugin::DistributionsPlugin() {}

  DistributionsPlugin::~DistributionsPlugin() {}

  double calculate_fisher_f(double alpha, int d1, int d2)
  {
    // Define the Fisher's F distribution
    boost::math::fisher_f_distribution<double> f_dist(d1, d2);

    // Calculate the critical value
    double critical_value = boost::math::quantile(boost::math::complement(f_dist, alpha));

    return critical_value;
  }

  double calculate_inverse_t(double alpha, int df)
  {
    // Define the Student's t distribution with the specified degrees of freedom
    boost::math::students_t_distribution<double> t_dist(df);

    // Calculate the critical value (inverse t)
    double critical_value = boost::math::quantile(boost::math::complement(t_dist, alpha));

    return critical_value;
  }

  void DistributionsPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    if (method_call.method_name().compare("inv") == 0)
    {
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      const double alpha = std::get<double>(arguments->at(flutter::EncodableValue("alpha")));
      const int df1 = std::get<int>(arguments->at(flutter::EncodableValue("df1")));
      const int df2 = std::get<int>(arguments->at(flutter::EncodableValue("df2")));
      double fisher_f = calculate_fisher_f(alpha, df1, df2);
      result->Success(flutter::EncodableValue(fisher_f));
    }
    else if (method_call.method_name().compare("student") == 0)
    {
      const auto *arguments = std::get_if<flutter::EncodableMap>(method_call.arguments());
      const double alpha = std::get<double>(arguments->at(flutter::EncodableValue("alpha")));
      const int df = std::get<int>(arguments->at(flutter::EncodableValue("df")));
      double t_critical = calculate_inverse_t(alpha, df);
      result->Success(flutter::EncodableValue(t_critical));
    }
    else
    {
      result->NotImplemented();
    }
  }

} // namespace distributions
