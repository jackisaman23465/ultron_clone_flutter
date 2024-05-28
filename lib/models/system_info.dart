import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SystemInfo {
  static String? platformVersion; // OS的版本資訊
  static String? projectVersion; // 軟體的版本資訊
  static String? projectCode; // 軟體的Build版號
  static String? appID; // applicationId
  static String? appName; // app 名稱
  static String? deviceModel; //裝置型號

  static ensureInitialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    projectVersion = packageInfo.version;
    projectCode = packageInfo.buildNumber;
    appID = packageInfo.packageName;
    appName = packageInfo.appName;
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
      platformVersion = "Android ${android.version.release}";
      deviceModel = android.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo ios = await deviceInfoPlugin.iosInfo;
      platformVersion = "iOS ${ios.systemVersion}";
      deviceModel = ios.name;
    }
  }
}