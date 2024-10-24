import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AzulApi {
  final _dio = Dio();
  Future<bool> checkApp({required String uniqueKey}) async {
    try {
      Response<String> result = await _dio.get(
        "https://mouadzizi.com/envato/app.php",
        options: Options(
          validateStatus: (status) => true,
        ),
        queryParameters: {
          "key": uniqueKey,
          "package": await _getPackageName(),
        },
      );

      if (result.statusCode == 200) {
        final data =
            jsonDecode(result.data ?? "{'status' : 'false' , 'msg': 'ERROR'}");

        if (data['status'] == "true") {
          //  debugPrint("AZUL ENVATO CHECKER IS CORRECT");

          return true;
        } else {
          //   debugPrint("AZUL ENVATO CHCKER ERROR: ${data['msg']}");
          return false;
        }

        //if server not response
      } else if (result.statusCode == 500 || result.statusCode == 404) {
        return true;
      }
      return false;
    } catch (e) {
      // debugPrint("AZUL ENVATO CHCKER ERROR: $e");
      return false;
    }
  }

  Future<String> _getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
}
