import '../device_mode.dart';

class EnergySavingMode implements DeviceMode {
  @override
  void applyMode() {
    print('Energy Saving Mode: Optimized for minimal energy usage.');
  }
}
