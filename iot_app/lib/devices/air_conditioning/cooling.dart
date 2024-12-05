import '../device_mode.dart';

class Cooling implements DeviceMode {
  @override
  void applyMode() {
    print('Cooling Mode: Provides a cooling effect for a comfortable environment.');
  }
}
