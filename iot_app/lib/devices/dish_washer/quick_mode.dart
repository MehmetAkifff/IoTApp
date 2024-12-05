import '../device_mode.dart';

class QuickMode implements DeviceMode {
  @override
  void applyMode() {
    print('Quick Mode: A quick wash program for lightly soiled dishes.');
  }
}
