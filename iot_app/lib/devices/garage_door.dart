import 'device.dart';

class GarageDoor implements Device {
  bool _isOn = false;

  @override
  String get name => 'GarageDoor';

  @override
  void turnOn() {
    _isOn = true;
    print('Garage door is now ON.');
  }

  @override
  void turnOff() {
    _isOn = false;
    print('Garage door is now OFF.');
  }

  @override
  bool get isOn => _isOn;
}
