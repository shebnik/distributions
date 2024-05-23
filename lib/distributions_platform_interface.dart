import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'distributions_method_channel.dart';

abstract class DistributionsPlatform extends PlatformInterface {
  /// Constructs a DistributionsPlatform.
  DistributionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static DistributionsPlatform _instance = MethodChannelDistributions();

  /// The default instance of [DistributionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelDistributions].
  static DistributionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DistributionsPlatform] when
  /// they register themselves.
  static set instance(DistributionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) {
    throw UnimplementedError('inv() has not been implemented.');
  }
}
