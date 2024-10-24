import 'package:flutter_test/flutter_test.dart';
import 'package:azul_envato_checker/azul_envato_checker.dart';
import 'package:azul_envato_checker/azul_envato_checker_platform_interface.dart';
import 'package:azul_envato_checker/azul_envato_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAzulEnvatoCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AzulEnvatoCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AzulEnvatoCheckerPlatform initialPlatform =
      AzulEnvatoCheckerPlatform.instance;

  test('$MethodChannelAzulEnvatoChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAzulEnvatoChecker>());
  });

  test('getPlatformVersion', () async {
    AzulEnvatoCheckerPlatformVersion azulEnvatoCheckerPlugin =
        AzulEnvatoCheckerPlatformVersion();
    MockAzulEnvatoCheckerPlatform fakePlatform =
        MockAzulEnvatoCheckerPlatform();
    AzulEnvatoCheckerPlatform.instance = fakePlatform;

    expect(await azulEnvatoCheckerPlugin.getPlatformVersion(), '42');
  });
}
