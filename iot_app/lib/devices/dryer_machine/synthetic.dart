import '../device_mode.dart';

class Synthetic implements DeviceMode {
  @override
  void applyMode() {
    print(
        'Synthetic Dry Mode: Used at lower temperatures to protect delicate synthetic fabrics.');
  }
}
