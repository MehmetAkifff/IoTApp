import '../device.dart';

class AirConditioner implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Air Conditioner";

  @override
  void turnOn() {
    _isOn = true;
    print("Air Conditioner is now ON with settings: $_settings");

    // Simulate operation
    Future.delayed(const Duration(seconds: 5), () {
      _isOn = false;
      print("Air Conditioner operation completed.");
    });
  }

  @override
  void turnOff() {
    _isOn = false;
    print("Air Conditioner is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    if (!_isOn) {
      return null;
    }
    return {
      "Mode": ["Cool", "Heat", "Fan", "Dry", "Auto"],
      "Temperature": {"min": 16, "max": 30, "default": 22, "step": 1},
      "Fan Speed": ["Low", "Medium", "High", "Auto"],
    };
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    _settings = settings;
    print("Air Conditioner settings applied: $_settings");
  }
}
