import '../device_mode.dart';

class PreWash implements DeviceMode {
  @override
  void applyMode() {
    print('Pre-Wash Mode: Pre-washes the dishes.');
  }
}
