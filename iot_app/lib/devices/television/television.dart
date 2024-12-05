import '../device.dart';

class Television implements Device {
  bool _isOn = false;

  @override
  String get name => 'Television';

  @override
  void turnOn() {
    _isOn = true;
    print('Television is now ON.');
  }

  @override
  void turnOff() {
    _isOn = false;
    print('Television is now OFF.');
  }

  @override
  bool get isOn => _isOn;
}
