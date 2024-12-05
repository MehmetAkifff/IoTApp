import '../device_mode.dart';

class Cotton implements DeviceMode {
  @override
  void applyMode() {
    print(
        'Cotton Wash Mode: Provides high temperature drying for thick and durable fabrics.');
  }
}
