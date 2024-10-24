import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:azul_envato_checker/azul_envato_checker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAzulEnvatoChecker platform = MethodChannelAzulEnvatoChecker();
  const MethodChannel channel = MethodChannel('azul_envato_checker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
