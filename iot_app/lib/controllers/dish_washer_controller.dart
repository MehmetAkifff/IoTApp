import 'dart:io';
import '../devices/device.dart';
import '../devices/dish_washer/dish_washer.dart';
import '../devices/dish_washer/dish_washer_settings.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';

class DishWasherController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    if (device is! DishWasher) return;

    final DishWasher dishWasher = device;

    while (true) {
      print('\nDish Washer Control:');
      print('1. Configure Settings');
      print('2. Turn ON');
      print('3. Turn OFF');
      print('4. Back to Devices');

      final command = stdin.readLineSync();

      switch (command) {
        case '1':
          _configureSettings(dishWasher);
          break;
        case '2':
          if (!dishWasher.isOn) {
            dishWasher.turnOn();
          } else {
            print('Error: Dish Washer is already ON.');
          }
          break;
        case '3':
          if (dishWasher.isOn) {
            dishWasher.turnOff();
          } else {
            print('Error: Dish Washer is already OFF.');
          }
          break;
        case '4':
          return;
        default:
          print('Invalid Command!');
      }
    }
  }

  void _configureSettings(DishWasher dishWasher) {
    if (dishWasher.isOn) {
      print('Error: Cannot configure settings while the Dish Washer is ON.');
      return;
    }

    final DishWasherSettingsBuilder builder = DishWasherSettingsBuilder();

    print('Select Mode:');
    print('1. Quick Wash');
    print('2. Pre-Wash');
    print('3. Intensive Wash');
    print('4. Half Load Mode');
    print('5. Standard Wash');
    print('6. Extra Rinse');

    final modeChoice = stdin.readLineSync();
    switch (modeChoice) {
      case '1':
        builder.setMode('Quick Wash');
        break;
      case '2':
        builder.setMode('Pre-Wash');
        break;
      case '3':
        builder.setMode('Intensive Wash');
        break;
      case '4':
        builder.setMode('Half Load Mode');
        break;
      case '5':
        builder.setMode('Standard Wash');
        break;
      case '6':
        builder.setMode('Extra Rinse');
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

    final settings = builder.build();
    dishWasher.setSettings(settings);
    print('Dish Washer settings configured successfully.');
  }
}
