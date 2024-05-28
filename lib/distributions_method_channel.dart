import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'distributions_platform_interface.dart';

/// An implementation of [DistributionsPlatform] that uses method channels.
class MethodChannelDistributions extends DistributionsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('distributions');

  @override
  Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) async {
    return await methodChannel.invokeMethod<double>(
      'inv',
      <String, dynamic>{
        'alpha': alpha,
        'df1': df1,
        'df2': df2,
      },
    );
  }

  @override
  Future<double?> student({
    required double alpha,
    required int df,
  }) async {
    return await methodChannel.invokeMethod<double>(
      'student',
      <String, dynamic>{
        'alpha': alpha,
        'df': df,
      },
    );
  }
}
