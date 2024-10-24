import 'azul_envato_checker_platform_interface.dart';
export 'src/checker.dart';

//dart pub publish --dry-run
//dart pub publish

class AzulEnvatoCheckerPlatformVersion {
  Future<String?> getPlatformVersion() {
    return AzulEnvatoCheckerPlatform.instance.getPlatformVersion();
  }
}
