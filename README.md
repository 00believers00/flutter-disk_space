# [Flutter Plugin] Disk Space

Plugin for get serial-numbers of windows.

## Features

- Get data first hard disk serial-number.
- Get data all hard disk serial-numbers.

## Installation
```yaml
dependencies:
  flutter:
    sdk: flutter

  disk_space:
    git:
      url: https://github.com/00believers00/flutter-disk_space.git
      ref: <tag or branch>
```

## Methods

| Callback     | Function             | Description                             |
|--------------|----------------------|-----------------------------------------|
| String?      | getFirstSerialNumber | Get data first hard disk serial-number. |
| List<String> | getSerialNumbers     | Get data all hard disk serial-numbers.  |

## Example
```dart
final diskSpace = DiskSpace();

// Get data all hard disk serial-numbers. 
List<String> serialNumbers = await diskSpace.getSerialNumbers();
print('Serial Numbers:$serialNumbers');

// Get data first hard disk serial-number.
String? serialNumber = await diskSpace.getFirstSerialNumber();
print('Serial Number:$serialNumber');
```
## License

MIT

