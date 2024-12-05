import 'dart:async';
import '../device.dart';
import '../../observer/device_status_observer.dart';
import 'dish_washer_settings.dart';

class DishWasher implements Device {
  bool _isOn = false;
  DishWasherSettings? _settings;
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
  String get name => 'DishWasher';

  @override
  void turnOn() {
    if (_isOn) {
      print('Error: Dishwasher is already ON.');
      return;
    }
    if (_settings == null) {
      print('Error: Please configure dishwasher settings before starting!');
      return;
    }
    _isOn = true;
    print('Dishwasher is now ON with the following settings:');
    print(_settings);

    // Program süresi boyunca çalışmayı simüle et
    Timer(Duration(seconds: _settings!.duration), () {
      _isOn = false;
      print('Dishwasher has completed the ${_settings!.mode} program.');
      _notifyObservers('Dishwasher completed: ${_settings!.mode}.');
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print('Error: Dishwasher is already OFF.');
      return;
    }
    _isOn = false;
    print('Dishwasher is now OFF.');
  }

  @override
  bool get isOn => _isOn;

  void setSettings(DishWasherSettings settings) {
    if (_isOn) {
      print('Error: Cannot change settings while the Dishwasher is ON.');
      return;
    }
    _settings = settings;
    print('Settings applied: $settings');
  }
}
