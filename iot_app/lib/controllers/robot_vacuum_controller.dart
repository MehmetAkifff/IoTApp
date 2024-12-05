import 'dart:io';
import '../devices/device.dart';
import '../devices/robot_vacuum/robot_vacuum.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';

class RobotVacuumController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    if (device is! RobotVacuum) return;

    final RobotVacuum robotVacuum = device;

    while (true) {
      print('\nRobot Vacuum Control:');
      print('1. Select Room');
      print('2. Turn ON');
      print('3. Turn OFF');
      print('4. Back to Devices');

      final command = stdin.readLineSync();
      switch (command) {
        case '1':
          print('Available Rooms:');
          print('1. Living Room');
          print('2. Kitchen');
          print('3. Bedroom');
          print('Enter your choice:');
          final roomChoice = stdin.readLineSync();

          String? selectedRoom;
          switch (roomChoice) {
            case '1':
              selectedRoom = 'Living Room';
              break;
            case '2':
              selectedRoom = 'Kitchen';
              break;
            case '3':
              selectedRoom = 'Bedroom';
              break;
            default:
              print('Invalid room selection.');
          }

          if (selectedRoom != null) {
            robotVacuum.selectRoom(selectedRoom);
          }
          break;

        case '2':
          robotVacuum.turnOn();
          break;

        case '3':
          robotVacuum.turnOff();
          break;

        case '4':
          return;

        default:
          print('Invalid Command!');
      }
    }
  }
}
