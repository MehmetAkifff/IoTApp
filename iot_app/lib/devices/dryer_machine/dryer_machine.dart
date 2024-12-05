import 'dart:async';
import '../device.dart';
import '../../observer/device_status_observer.dart';
import 'dryer_machine_settings.dart';

class DryerMachine implements Device {
  bool _isOn = false;
  DryerMachineSettings? _settings;
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
  String get name => 'DryerMachine';

  @override
  void turnOn() {
    if (_isOn) {
      print('Error: DryerMachine is already ON.');
      return;
    }
    if (_settings == null) {
      print('Error: Please configure dryer machine settings before starting!');
      return;
    }
    _isOn = true;
    print('DryerMachine is now ON with the following settings:');
    print(_settings);

    // Mod süresi boyunca çalışmayı simüle et
    Timer(Duration(seconds: _settings!.duration), () {
      _isOn = false;
      print('DryerMachine has completed the ${_settings!.mode} mode.');
      _notifyObservers('DryerMachine completed: ${_settings!.mode}.');
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print('Error: DryerMachine is already OFF.');
      return;
    }
    _isOn = false;
    print('DryerMachine is now OFF.');
  }

  @override
  bool get isOn => _isOn;

  void setSettings(DryerMachineSettings settings) {
    if (_isOn) {
      print('Error: Cannot change settings while the DryerMachine is ON.');
      return;
    }
    _settings = settings;
    print('Settings applied: $settings');
  }
}
