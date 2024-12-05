import '../device_mode.dart';

class Dehumidifying implements DeviceMode {
  @override
  void applyMode() {
    print('Dehumidifying Mode: Reduces humidity in the room.');
  }
}
