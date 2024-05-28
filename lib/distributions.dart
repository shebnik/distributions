import 'distributions_platform_interface.dart';

class Distributions {

  /// Calculates the inverse of the F-distribution.
  /// [alpha] is the significance level.
  /// [df1] is the numerator degrees of freedom.
  /// [df2] is the denominator degrees of freedom.
  static Future<double?> inv({
    required double alpha,
    required int df1,
    required int df2,
  }) async {
    return DistributionsPlatform.instance.inv(alpha: alpha, df1: df1, df2: df2);
  }


  /// Calculates the t-distribution.
  /// [alpha] is the significance level.
  /// [df] is the degrees of freedom.
  static Future<double?> student({
    required double alpha,
    required int df,
  }) {
    return DistributionsPlatform.instance.student(alpha: alpha, df: df);
  }
}
