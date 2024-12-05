import '../device_mode.dart';

class IntensiveMode implements DeviceMode {
  @override
  void applyMode() {
    print(
        'Intensive Mode: Suitable for heavily soiled dishes like pots and pans.');
  }
}
