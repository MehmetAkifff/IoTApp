import 'dart:async';
import '../device.dart';
import '../../observer/device_status_observer.dart';
import 'air_conditioner_settings.dart';

class AirConditioner implements Device {
  bool _isOn = false;
  AirConditionerSettings? _settings;
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
  String get name => 'Air Conditioner';

  @override
  void turnOn() {
    if (_isOn) {
      print('Error: Air Conditioner is already ON.');
      return;
    }
    if (_settings == null) {
      print('Error: Please configure Air Conditioner settings before starting!');
      return;
    }
    _isOn = true;
    print('Air Conditioner is now ON with the following settings:');
    print(_settings);

    // Program süresi boyunca çalışmayı simüle et
    Timer(Duration(seconds: _settings!.duration), () {
      _isOn = false;
      print('Air Conditioner has completed the ${_settings!.mode} program.');
      _notifyObservers('Air Conditioner completed: ${_settings!.mode}.');
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print('Error: Air Conditioner is already OFF.');
      return;
    }
    _isOn = false;
    print('Air Conditioner is now OFF.');
  }

  @override
  bool get isOn => _isOn;

  void setSettings(AirConditionerSettings settings) {
    if (_isOn) {
      print('Error: Cannot change settings while the Air Conditioner is ON.');
      return;
    }
    _settings = settings;
    print('Settings applied: $settings');
  }
}
