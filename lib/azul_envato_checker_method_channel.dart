import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'azul_envato_checker_platform_interface.dart';

/// An implementation of [AzulEnvatoCheckerPlatform] that uses method channels.
class MethodChannelAzulEnvatoChecker extends AzulEnvatoCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('azul_envato_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
