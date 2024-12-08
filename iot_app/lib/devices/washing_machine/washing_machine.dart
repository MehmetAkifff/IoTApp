import '../device.dart';

class WashingMachine implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Washing Machine";

  @override
  void turnOn() {
    if (_settings == null || _settings!["Mode"] == null) {
      print("Error: Please configure the washing mode before starting the machine.");
      return;
    }
    _isOn = true;
    print("Washing Machine is now ON with settings: $_settings");
  }

  @override
  void turnOff() {
    _isOn = false;
    print("Washing Machine is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    return {
      "Mode": ["Quick Wash", "Daily Wash", "Intensive Wash", "Energy Saving"],
      "Temperature": {"min": 0, "max": 90, "default": 40},
      "Spin Speed": {"min": 400, "max": 1600, "default": 800},
    };
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    _settings = settings;
    print("Washing Machine settings applied: $_settings");
  }
}
