import '../devices/device.dart';
import '../observer/device_status_observer.dart';
import '../commands/command.dart';

class IoTController {
  static final IoTController _instance = IoTController._internal();
  final List<Device> _devices = [];
  final List<DeviceStatusObserver> _observers = [];

  IoTController._internal();

  static IoTController getInstance() {
    return _instance;
  }

  void registerDevice(Device device) {
    _devices.add(device);
    notifyObservers('${device.name} has been registered.');
  }

  void addObserver(DeviceStatusObserver observer) {
    _observers.add(observer);
  }

  void executeCommand(Command command) {
    command.execute();
  }

  void undoCommand(Command command) {
    command.undo();
  }

  List<Device> getDevices() {
    return _devices;
  }

  void notifyObservers(String message) {
    for (final observer in _observers) {
      observer.update(message);
    }
  }
}
