import 'device.dart';

class LightBulb implements Device {
  bool _isOn = false;

  @override
  String getName() => "Light Bulb";

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
    // LightBulb ayarları olmadığı için hiçbir şey yapmaz
  }
}
