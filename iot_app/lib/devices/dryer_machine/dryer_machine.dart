import '../device.dart';

class DryerMachine implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Dryer Machine";

  @override
  void turnOn() {
    if (_settings == null || _settings!["Mode"] == null) {
      print("Error: Please configure the drying mode before starting the machine.");
      return;
    }
    _isOn = true;
    print("Dryer Machine is now ON with settings: $_settings");

    // Simulate operation
    Future.delayed(const Duration(seconds: 5), () {
      _isOn = false;
      print("Dryer Machine operation completed.");
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print("Error: Dryer Machine is already OFF.");
      return;
    }
    _isOn = false;
    print("Dryer Machine is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    return {
      "Mode": ["Quick Dry", "Delicates", "Normal", "Heavy"],
      "Temperature": {"min": 30, "max": 90, "default": 60},
      "Dryness Level": ["Damp", "Normal", "Extra Dry"],
    };
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    if (!settings.containsKey("Mode") || !settings.containsKey("Temperature")) {
      print("Error: Invalid settings. Mode and Temperature are required.");
      return;
    }
    _settings = settings;
    print("Dryer Machine settings applied: $_settings");
  }
}
