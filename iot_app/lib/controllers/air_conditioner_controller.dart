import 'dart:io';
import '../devices/device.dart';
import '../devices/air_conditioning/air_conditioner.dart';
import '../devices/air_conditioning/air_conditioner_settings.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';

class AirConditionerController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    if (device is! AirConditioner) return;

    final AirConditioner airConditioner = device as AirConditioner;

    while (true) {
      print('\nAir Conditioner Control:');
      print('1. Configure Settings');
      print('2. Turn ON');
      print('3. Turn OFF');
      print('4. Back to Devices');

      final command = stdin.readLineSync();

      switch (command) {
        case '1':
          _configureSettings(airConditioner);
          break;
        case '2':
          airConditioner.turnOn();
          break;
        case '3':
          airConditioner.turnOff();
          break;
        case '4':
          return;
        default:
          print('Invalid Command!');
      }
    }
  }

  void _configureSettings(AirConditioner airConditioner) {
    if (airConditioner.isOn) {
      print('Error: Cannot configure settings while the Air Conditioner is ON.');
      return;
    }

    final AirConditionerSettingsBuilder builder = AirConditionerSettingsBuilder();

    // Mod seçimi
    print('Select Mode:');
    print('1. Cooling');
    print('2. Heating');
    print('3. Fan');
    print('4. Dehumidify');
    print('5. Auto');

    final modeChoice = stdin.readLineSync();
    switch (modeChoice) {
      case '1':
        builder.setMode('Cooling');
        break;
      case '2':
        builder.setMode('Heating');
        break;
      case '3':
        builder.setMode('Fan');
        break;
      case '4':
        builder.setMode('Dehumidify');
        break;
      case '5':
        builder.setMode('Auto');
        break;
      default:
        print('Invalid mode selection.');
        return;
    }

    // Fan hızı seçimi
    print('Select Fan Speed:');
    print('1. Low');
    print('2. Medium');
    print('3. High');
    print('4. Auto');

    final fanSpeedChoice = stdin.readLineSync();
    switch (fanSpeedChoice) {
      case '1':
        builder.setFanSpeed('Low');
        break;
      case '2':
        builder.setFanSpeed('Medium');
        break;
      case '3':
        builder.setFanSpeed('High');
        break;
      case '4':
        builder.setFanSpeed('Auto');
        break;
      default:
        print('Invalid fan speed selection.');
        return;
    }

    // Sıcaklık ayarı
    print('Enter Temperature (16°C - 30°C):');
    final temperatureInput = stdin.readLineSync();
    int temperature;
    try {
      temperature = int.parse(temperatureInput!);
      builder.setTemperature(temperature);
    } on FormatException {
      print('Invalid temperature input.');
      return;
    } on ArgumentError catch (e) {
      print(e.message);
      return;
    }

    // Ayarları uygulama
    final settings = builder.build();
    airConditioner.setSettings(settings);
    print('Settings applied: $settings');
  }
}
