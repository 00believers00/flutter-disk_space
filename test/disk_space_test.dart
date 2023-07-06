import 'package:flutter_test/flutter_test.dart';
import 'package:disk_space/disk_space_platform_interface.dart';
import 'package:disk_space/disk_space_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDiskSpacePlatform
    with MockPlatformInterfaceMixin
    implements DiskSpacePlatform {
  @override
  Future<List<String>> getSerialNumber() => Future.value(
        <String>['ABCD123154', 'ABCD123154'],
      );
}

void main() {
  final DiskSpacePlatform initialPlatform = DiskSpacePlatform.instance;

  test('$MethodChannelDiskSpace is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDiskSpace>());
  });
}
