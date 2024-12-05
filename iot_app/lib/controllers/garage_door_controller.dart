import 'dart:io';
import '../devices/device.dart';
import '../singleton/iot_controller.dart';
import '../commands/invoker.dart';
import '../commands/turn_on_command.dart';
import '../commands/turn_off_command.dart';
import 'device_controller.dart';

class GarageDoorController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    final Invoker invoker = Invoker(); // Invoker oluştur
    bool exitMenu = false;

    while (!exitMenu) {
      print('\n${device.name} Control:');
      print('1. Turn ON');
      print('2. Turn OFF');
      print('3. Undo Last Action');
      print('4. Back to Devices');

      final commandInput = stdin.readLineSync();

      switch (commandInput) {
        case '1': // Turn ON
          invoker.executeCommand(TurnOnCommand(device));
          break;

        case '2': // Turn OFF
          invoker.executeCommand(TurnOffCommand(device));
          break;

        case '3': // Undo
          invoker.undo();
          break;

        case '4': // Menüden çıkış
          exitMenu = true;
          break;

        default:
          print('Invalid option! Please try again.');
      }
    }
  }
}
