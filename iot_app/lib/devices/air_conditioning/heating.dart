import '../device_mode.dart';

class Heating implements DeviceMode {
  @override
  void applyMode() {
    print('Heating Mode: Provides warmth to keep the room cozy.');
  }
}
