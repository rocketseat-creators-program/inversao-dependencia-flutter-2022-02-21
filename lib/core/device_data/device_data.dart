import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

enum PlatformApp { ios, android, web }

abstract class IDeviceData {
  PlatformApp getPlatform();
  Future<String> getModel();
}

class DeviceData implements IDeviceData {
  final DeviceInfoPlugin _deviceInfoPlugin;
  final Platform _platform;
  DeviceData( {
    required DeviceInfoPlugin deviceInfoPlugin,
    required Platform platform,
  }) : _deviceInfoPlugin = deviceInfoPlugin, _platform = platform;

  @override
  Future<String> getModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.model ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
      return iosInfo.utsname.machine ?? '';
    } else {
      WebBrowserInfo webBrowserInfo = await _deviceInfoPlugin.webBrowserInfo;
      return webBrowserInfo.userAgent ?? '';
    }
  }

  @override
  PlatformApp getPlatform() {
    if (Platform.isAndroid) {
      return PlatformApp.android;
    } else if (Platform.isIOS) {
      return PlatformApp.ios;
    } else {
      return PlatformApp.web;
    }
  }
}
