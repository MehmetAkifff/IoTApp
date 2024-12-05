import 'dart:io';
import '../devices/device.dart';
import '../devices/dryer_machine/dryer_machine.dart';
import '../devices/dryer_machine/dryer_machine_settings.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';

class DryerMachineController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    if (device is! DryerMachine) return;

    final DryerMachine dryerMachine = device;

    while (true) {
      print('\nDryer Machine Control:');
      print('1. Configure Settings');
      print('2. Turn ON');
      print('3. Turn OFF');
      print('4. Back to Devices');

      final command = stdin.readLineSync();

      switch (command) {
        case '1':
          _configureSettings(dryerMachine);
          break;
        case '2':
          if (!dryerMachine.isOn) {
            dryerMachine.turnOn();
          } else {
            print('Error: Dryer Machine is already ON.');
          }
          break;
        case '3':
          if (dryerMachine.isOn) {
            dryerMachine.turnOff();
          } else {
            print('Error: Dryer Machine is already OFF.');
          }
          break;
        case '4':
          return;
        default:
          print('Invalid Command!');
      }
    }
  }

  void _configureSettings(DryerMachine dryerMachine) {
    if (dryerMachine.isOn) {
      print('Error: Cannot configure settings while the Dryer Machine is ON.');
      return;
    }

    final DryerMachineSettingsBuilder builder = DryerMachineSettingsBuilder();

    print('Select Mode:');
    print('1. Quick Drying');
    print('2. Ventilation Drying');
    print('3. Eco Drying');
    print('4. Synthetic Drying');

    final modeChoice = stdin.readLineSync();
    switch (modeChoice) {
      case '1':
        builder.setMode('Quick Drying');
        break;
      case '2':
        builder.setMode('Ventilation Drying');
        break;
      case '3':
        builder.setMode('Eco Drying');
        break;
      case '4':
        builder.setMode('Synthetic Drying');
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

    print('Select Degree of Drying (1, 2, 3, 4):');
    final degreeOfDryingInput = stdin.readLineSync();
    final int? degreeOfDrying = int.tryParse(degreeOfDryingInput ?? '');
    if (degreeOfDrying == null || degreeOfDrying < 1 || degreeOfDrying > 4) {
      print('Invalid degree of drying selection.');
      return;
    }
    builder.setDegreeOfDry(degreeOfDrying);

    final settings = builder.build();
    dryerMachine.setSettings(settings);
    print('Dryer Machine settings configured successfully.');
  }
}
