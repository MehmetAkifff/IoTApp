import '../device_mode.dart';

class IntensiveWashMode implements DeviceMode {
  @override
  void applyMode() {
    print('Intensive Wash Mode: Longer cycle for heavily soiled clothes.');
  }
}
