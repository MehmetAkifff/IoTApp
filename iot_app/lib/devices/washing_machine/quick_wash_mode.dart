import '../device_mode.dart';

class QuickWashMode implements DeviceMode {
  @override
  void applyMode() {
    print('Quick Wash Mode: Short cycle for lightly soiled clothes.');
  }
}
