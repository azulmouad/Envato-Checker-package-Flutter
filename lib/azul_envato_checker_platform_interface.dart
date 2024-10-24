import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'azul_envato_checker_method_channel.dart';

abstract class AzulEnvatoCheckerPlatform extends PlatformInterface {
  /// Constructs a AzulEnvatoCheckerPlatform.
  AzulEnvatoCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AzulEnvatoCheckerPlatform _instance = MethodChannelAzulEnvatoChecker();

  /// The default instance of [AzulEnvatoCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAzulEnvatoChecker].
  static AzulEnvatoCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AzulEnvatoCheckerPlatform] when
  /// they register themselves.
  static set instance(AzulEnvatoCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
