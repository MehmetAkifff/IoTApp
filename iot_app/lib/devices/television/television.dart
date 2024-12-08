import '../device.dart';

class Television implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Television";

  @override
  void turnOn() {
    _isOn = true;
    print("Television is now ON with settings: $_settings");
  }

  @override
  void turnOff() {
    _isOn = false;
    print("Television is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    if (_isOn) {
      return {
        "Volume": {"min": 0, "max": 100, "default": 50},
        "Brightness": {"min": 0, "max": 100, "default": 70},
        "Channel": {"min": 1, "max": 500, "default": 1},
      };
    } else {
      return null;
    }
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    _settings = settings;
    print("Television settings applied: $_settings");
  }
}
