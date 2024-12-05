import '../device_mode.dart';

class HalfLoadMode implements DeviceMode {
  @override
  void applyMode() {
    print(
        'Half Load Mode: Washes with less water and energy when the dishwasher is not fully loaded.');
  }
}
