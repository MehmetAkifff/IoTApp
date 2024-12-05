import 'device.dart';

class LightBulb implements Device {
  bool _isOn = false;

  @override
  String get name => 'LightBulb';

  @override
  void turnOn() {
    _isOn = true;
    print('LightBulb is now ON.');
  }

  @override
  void turnOff() {
    _isOn = false;
    print('LightBulb is now OFF.');
  }

  @override
  bool get isOn => _isOn;
}
