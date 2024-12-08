import '../device.dart';

class RobotVacuum implements Device {
  bool _isOn = false;
  Map<String, dynamic>? _settings;

  @override
  String getName() => "Robot Vacuum";

  @override
  void turnOn() {
    if (_settings == null || _settings!["Room"] == null) {
      print("Error: Please select a room before starting the Robot Vacuum.");
      return;
    }
    _isOn = true;
    print("Robot Vacuum is now ON in the room: ${_settings!["Room"]}");
  }

  @override
  void turnOff() {
    _isOn = false;
    print("Robot Vacuum is now OFF.");
  }

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() {
    return {
      "Room": ["Living Room", "Bedroom", "Kitchen", "Bathroom"], // Dropdown için odalar
    };
  }

  @override
  void applySettings(Map<String, dynamic> settings) {
    if (!getSettingsSchema()!.containsKey("Room") || !getSettingsSchema()!["Room"].contains(settings["Room"])) {
      print("Error: Invalid room selected.");
      return;
    }
    _settings = settings;
    print("Robot Vacuum settings applied: $_settings");
  }
}
