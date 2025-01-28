import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

final class DeviceIdGetter {
  const DeviceIdGetter._();

  static Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      final webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.userAgent;
    }

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return const AndroidId().getId();
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else if (Platform.isMacOS) {
      final macOSInfo = await deviceInfo.macOsInfo;
      return macOSInfo.systemGUID;
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      return windowsInfo.deviceId;
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      return linuxInfo.machineId;
    }

    return null;
  }
}
