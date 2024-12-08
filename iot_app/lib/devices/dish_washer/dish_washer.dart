import '../device.dart';

class DishWasher implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Dish Washer";

  @override
  void turnOn() {
    if (_settings == null || _settings!["Mode"] == null) {
      print("Error: Please configure the washing mode before starting the machine.");
      return;
    }
    _isOn = true;
    print("Dish Washer is now ON with settings: $_settings");

    // Simulate operation
    Future.delayed(const Duration(seconds: 5), () {
      _isOn = false;
      print("Dish Washer operation completed.");
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print("Error: Dish Washer is already OFF.");
      return;
    }
    _isOn = false;
    print("Dish Washer is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    return {
      "Mode": ["Quick Wash", "Eco", "Intensive", "Rinse Only"],
      "Temperature": {"min": 30, "max": 90, "default": 60},
      "Drying Level": ["No Drying", "Normal Drying", "Extra Dry"],
    };
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    if (!settings.containsKey("Mode") || !settings.containsKey("Temperature")) {
      print("Error: Invalid settings. Mode and Temperature are required.");
      return;
    }
    _settings = settings;
    print("Dish Washer settings applied: $_settings");
  }
}
