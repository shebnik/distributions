import 'package:flutter_test/flutter_test.dart';
import 'package:distributions/distributions.dart';
import 'package:distributions/distributions_platform_interface.dart';
import 'package:distributions/distributions_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDistributionsPlatform
    with MockPlatformInterfaceMixin
    implements DistributionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DistributionsPlatform initialPlatform = DistributionsPlatform.instance;

  test('$MethodChannelDistributions is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDistributions>());
  });

  test('getPlatformVersion', () async {
    Distributions distributionsPlugin = Distributions();
    MockDistributionsPlatform fakePlatform = MockDistributionsPlatform();
    DistributionsPlatform.instance = fakePlatform;

    expect(await distributionsPlugin.getPlatformVersion(), '42');
  });
}
