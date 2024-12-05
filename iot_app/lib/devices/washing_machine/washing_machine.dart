import 'dart:async';
import '../device.dart';
import '../../observer/device_status_observer.dart';
import 'washing_machine_settings.dart';

class WashingMachine implements Device {
  bool _isOn = false;
  WashingMachineSettings? _settings;
  final List<DeviceStatusObserver> _observers = [];

  // Gözlemci ekleme
  void addObserver(DeviceStatusObserver observer) {
    _observers.add(observer);
  }

  void _notifyObservers(String message) {
    for (final observer in _observers) {
      observer.update(message);
    }
  }

  @override
  String get name => 'WashingMachine';

  @override
  void turnOn() {
    if (_isOn) {
      print('Error: WashingMachine is already ON.');
      return;
    }
    if (_settings == null) {
      print('Error: Please configure washing machine settings before starting!');
      return;
    }
    _isOn = true;
    print('WashingMachine is now ON with the following settings:');
    print(_settings);

    // Mod süresi boyunca çalışmayı simüle et
    Timer(Duration(seconds: _settings!.duration), () {
      _isOn = false;
      print('WashingMachine has completed the ${_settings!.mode} mode.');
      _notifyObservers('WashingMachine completed: ${_settings!.mode}.');
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print('Error: WashingMachine is already OFF.');
      return;
    }
    _isOn = false;
    print('WashingMachine is now OFF.');
  }

  @override
  bool get isOn => _isOn;

  void setSettings(WashingMachineSettings settings) {
    if (_isOn) {
      print('Error: Cannot change settings while the WashingMachine is ON.');
      return;
    }
    _settings = settings;
    print('Settings applied: $settings');
  }
}
