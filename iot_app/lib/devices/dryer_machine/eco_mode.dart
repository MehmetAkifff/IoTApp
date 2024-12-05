import '../device_mode.dart';

class EcoMode implements DeviceMode {
  @override
  void applyMode() {
    print('Eco Dry Mode: Dries with less energy consumption.');
  }
}
