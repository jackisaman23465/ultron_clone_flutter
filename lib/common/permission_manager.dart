import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager{
  /// 檢查推播權限是否允許
  static Future<bool> isNotificationPermissionGranted() async {
    bool result = false;
    /// check notification permission
    final notificationStatus = await Permission.notification.request();
    if (notificationStatus == PermissionStatus.granted) {
      if (kDebugMode) print('notificationStatus permission granted');
      result = true;
    }
    return result;
  }

  /// 檢查麥克風權限是否允許
  static Future<bool> isMicrophonePermissionGranted() async {
    bool result = false;
    /// check microphone permission
    final microphoneStatus = await Permission.microphone.request();
    if (microphoneStatus == PermissionStatus.granted) {
      if (kDebugMode) print('microphone permission granted');
      result = true;
    }
    return result;
  }

  /// 檢查相機權限是否允許
  static Future<bool> checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.camera.request();
      if (requestStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      return false;
    }
    return false;
  }

  /// 檢查引用圖庫權限是否允許
  static Future<bool> checkGalleryPermission() async {
    PermissionStatus status = await Permission.photos.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      PermissionStatus requestStatus = await Permission.photos.request();
      if (requestStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } else if (status.isPermanentlyDenied) {
      return false;
    }
    return false;
  }
}