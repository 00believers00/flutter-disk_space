import 'package:disk_space/utils/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disk_space_platform_interface.dart';

/// An implementation of [DiskSpacePlatform] that uses method channels.
class MethodChannelDiskSpace extends DiskSpacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disk_space');

  @override
  Future<List<String>> getSerialNumbers() async {
    final version = await methodChannel.invokeMethod<String>('getSerialNumbers');
    List<String> list = [];
    if(version != null){
      list = Helpers.splitSerialnumberText(version);
    }
    return list;
  }
  @override
  Future<String?> getFirstSerialNumber() async {
    final version = await methodChannel.invokeMethod<String>('getFirstSerialNumber');
    String? serialNumber;
    if(version != null){
      List<String> list = Helpers.splitSerialnumberText(version);
      if(list.isNotEmpty){
        serialNumber = list.first;
      }
    }
    return serialNumber;
  }
}
