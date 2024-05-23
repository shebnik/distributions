
import 'distributions_platform_interface.dart';

class Distributions {
  Future<String?> getPlatformVersion() {
    return DistributionsPlatform.instance.getPlatformVersion();
  }

  static Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) async {
    return DistributionsPlatform.instance.inv(alpha: alpha, df1: df1, df2: df2);
  }
}
