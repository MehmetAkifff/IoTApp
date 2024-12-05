import '../device_mode.dart';

class Fan implements DeviceMode {
  @override
  void applyMode() {
    print('Fan Mode: Circulates air without changing the temperature.');
  }
}
