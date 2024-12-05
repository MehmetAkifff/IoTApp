import '../device_mode.dart';

class VentilationMode implements DeviceMode {
  @override
  void applyMode() {
    print(
        'Ventilation Dry Mode: Provides high temperature drying for thick and durable fabrics.');
  }
}
