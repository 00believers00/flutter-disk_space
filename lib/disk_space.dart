
import 'disk_space_platform_interface.dart';

class DiskSpace {
  Future<List<String>> getSerialNumbers() {
    return DiskSpacePlatform.instance.getSerialNumbers();
  }

  Future<String?> getFirstSerialNumber() {
    return DiskSpacePlatform.instance.getFirstSerialNumber();
  }
}
