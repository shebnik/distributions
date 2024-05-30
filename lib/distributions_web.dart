// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'package:distributions/internal/jstat.dart' as jstat;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'distributions_platform_interface.dart';

/// A web implementation of the DistributionsPlatform of the Distributions plugin.
class DistributionsWeb extends DistributionsPlatform {
  /// Constructs a DistributionsWeb
  DistributionsWeb();

  static void registerWith(Registrar registrar) {
    DistributionsPlatform.instance = DistributionsWeb();
  }

  @override
  Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) async {
    try {
      return jstat.centralFInv(1 - alpha, df1, df2);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<double?> student({
    required double alpha,
    required int df,
  }) async {
    try {
      return jstat.studenttInv(1 - alpha / 2, df);
    } catch (e) {
      return null;
    }
  }
}
