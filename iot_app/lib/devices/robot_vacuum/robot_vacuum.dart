import 'dart:async';
import '../device.dart';
import '../../observer/device_status_observer.dart';
import 'robot_vacuum_settings.dart';

class RobotVacuum implements Device {
  bool _isOn = false;
  RobotVacuumSettings? _settings;
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
  String get name => 'Robot Vacuum';

  @override
  void turnOn() {
    if (_isOn) {
      print('Error: Robot Vacuum is already ON.');
      return;
    }
    if (_settings == null) {
      print('Error: Please configure Robot Vacuum settings before starting!');
      return;
    }
    _isOn = true;
    print('Robot Vacuum is now ON with the following settings:');
    print(_settings);

    // Program süresi boyunca çalışmayı simüle et
    Timer(const Duration(seconds: 5), () {
      _isOn = false;
      print('Robot Vacuum has completed cleaning.');
      _notifyObservers('Robot Vacuum completed cleaning.');
    });
  }

  @override
  void turnOff() {
    if (!_isOn) {
      print('Error: Robot Vacuum is already OFF.');
      return;
    }
    _isOn = false;
    print('Robot Vacuum is now OFF.');
  }

  @override
  bool get isOn => _isOn;

  // Ayarları değiştirme
  void setSettings(RobotVacuumSettings settings) {
    if (_isOn) {
      print('Error: Cannot change settings while the Robot Vacuum is ON.');
      return;
    }
    _settings = settings;
    print('Settings applied: $settings');
  }

  // Oda seçimi için bir metot
  void selectRoom(String room) {
    if (_isOn) {
      print('Error: Cannot change room while the Robot Vacuum is ON.');
      return;
    }
    if (_settings == null) {
      _settings = RobotVacuumSettingsBuilder().build();
    }
    _settings = RobotVacuumSettingsBuilder()
        .setRooms(room)
        .setIsOn(_settings!.isOn)
        .build();
    print('Room selected: $room');
    _notifyObservers('Room changed to: $room');
  }
}
