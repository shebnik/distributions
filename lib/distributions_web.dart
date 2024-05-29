// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:html' as html;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'distributions_platform_interface.dart';

/// A web implementation of the DistributionsPlatform of the Distributions plugin.
class DistributionsWeb extends DistributionsPlatform {
  /// Constructs a DistributionsWeb
  DistributionsWeb();

  static void registerWith(Registrar registrar) {
    DistributionsPlatform.instance = DistributionsWeb();
    html.document.body!.append(html.ScriptElement()
      ..src = 'https://cdn.jsdelivr.net/npm/jstat@latest/dist/jstat.min.js'
      ..type = 'application/javascript'
      ..defer = true);
  }

  @override
  Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) async {
    try {
      // evaulate javascript function jStat.centralF.inv(1 - alpha, d1, d2)
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<double?> student({
    required double alpha,
    required int df,
  }) async {
    try {
      // evaulate js function jStat.studentt.inv(1 - alpha / 2, df)
    } catch (e) {
      print(e);
    }
  }
}
