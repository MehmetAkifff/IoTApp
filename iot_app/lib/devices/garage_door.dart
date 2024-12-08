import 'device.dart';

class GarageDoor implements Device {
  bool _isOn = false;

  @override
  String getName() => "Garage Door";

  @override
  void turnOn() => _isOn = true;

  @override
  void turnOff() => _isOn = false;

  @override
  bool isOn() => _isOn;

  @override
  Map<String, dynamic>? getSettingsSchema() => null; // Ayar şeması yok

  @override
  void applySettings(Map<String, dynamic> settings) {
    // GarageDoor ayarları olmadığı için hiçbir şey yapmaz
  }
}