import 'dart:io';
import '../devices/device.dart';
import '../devices/washing_machine/washing_machine.dart';
import '../devices/washing_machine/washing_machine_settings.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';

class WashingMachineController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    if (device is! WashingMachine) return;

    final WashingMachine washingMachine = device;

    while (true) {
      print('\nWashing Machine Control:');
      print('1. Configure Settings');
      print('2. Turn ON');
      print('3. Turn OFF');
      print('4. Back to Devices');

      final command = stdin.readLineSync();

      switch (command) {
        case '1':
          _configureSettings(washingMachine);
          break;
        case '2':
          if (!washingMachine.isOn) {
            washingMachine.turnOn();
          } else {
            print('Error: Washing Machine is already ON.');
          }
          break;
        case '3':
          if (washingMachine.isOn) {
            washingMachine.turnOff();
          } else {
            print('Error: Washing Machine is already OFF.');
          }
          break;
        case '4':
          return;
        default:
          print('Invalid Command!');
      }
    }
  }

  void _configureSettings(WashingMachine washingMachine) {
    if (washingMachine.isOn) {
      print('Error: Cannot configure settings while the Washing Machine is ON.');
      return;
    }

    final WashingMachineSettingsBuilder builder = WashingMachineSettingsBuilder();

    print('Select Mode:');
    print('1. Quick Wash');
    print('2. Daily Wash');
    print('3. Intensive Wash');
    print('4. Energy Saving');

    final modeChoice = stdin.readLineSync();
    switch (modeChoice) {
      case '1':
        builder.setMode('Quick Wash');
        break;
      case '2':
        builder.setMode('Daily Wash');
        break;
      case '3':
        builder.setMode('Intensive Wash');
        break;
      case '4':
        builder.setMode('Energy Saving');
        break;
      default:
        print('Invalid mode selection.');
        return;
    }

    print('Select Temperature (30, 40, 60, 90):');
    final temperatureInput = stdin.readLineSync();
    final int? temperature = int.tryParse(temperatureInput ?? '');
    if (temperature == null || ![30, 40, 60, 90].contains(temperature)) {
      print('Invalid temperature selection.');
      return;
    }
    builder.setTemperature(temperature);

    print('Select Spin Speed (800, 1000, 1200, 1400):');
    final spinSpeedInput = stdin.readLineSync();
    final int? spinSpeed = int.tryParse(spinSpeedInput ?? '');
    if (spinSpeed == null || ![800, 1000, 1200, 1400].contains(spinSpeed)) {
      print('Invalid spin speed selection.');
      return;
    }
    builder.setSpinSpeed(spinSpeed);

    final settings = builder.build();
    washingMachine.setSettings(settings);
    print('Washing Machine settings configured successfully.');
  }
}
