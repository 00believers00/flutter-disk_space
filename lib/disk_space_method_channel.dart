import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disk_space_platform_interface.dart';

/// An implementation of [DiskSpacePlatform] that uses method channels.
class MethodChannelDiskSpace extends DiskSpacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disk_space');

  @override
  Future<List<String>> getSerialNumber() async {
    final version = await methodChannel.invokeMethod<String>('getSerialNumber');
    List<String> list = [];
    if (version != null) {
      List<String> strList = version.split(' ');
      for (String v in strList) {
        if (v.isNotEmpty &&
            !v.toLowerCase().contains('serialnumber')) {
          String s = v.replaceAll(RegExp(r"[.|_]|[\n|\-]|\r"), '');
          if(s.isNotEmpty){
            list.add(s);
          }
        }
      }
    }
    return list;
  }
}
