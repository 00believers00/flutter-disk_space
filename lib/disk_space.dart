
import 'disk_space_platform_interface.dart';

class DiskSpace {
  Future<List<String>> getSerialNumber() {
    return DiskSpacePlatform.instance.getSerialNumber();
  }

}
