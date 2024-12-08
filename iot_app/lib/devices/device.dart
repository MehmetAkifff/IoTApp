abstract class Device {
  String getName();
  void turnOn();
  void turnOff();
  bool isOn();
  Map<String, dynamic>? getSettingsSchema(); // Ayar şeması
  void applySettings(Map<String, dynamic> settings); // Ayarları uygular
}
