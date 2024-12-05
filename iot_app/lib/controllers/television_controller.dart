import 'dart:io';
import '../devices/device.dart';
import '../devices/television/television.dart';
import '../devices/television/change_channel.dart';
import '../devices/television/change_volume.dart';
import '../singleton/iot_controller.dart';
import '../commands/invoker.dart';
import '../commands/turn_on_command.dart';
import '../commands/turn_off_command.dart';
import '../commands/change_channel_command.dart';
import '../commands/increase_volume_command.dart';
import '../commands/decrease_volume_command.dart';
import 'device_controller.dart';

class TelevisionController implements DeviceController {
  @override
  void controlDevice(IoTController controller, Device device) {
    final Invoker invoker = Invoker(); // Invoker oluştur
    if (device is! Television) return;

    final Television television = device;
    final ChangeChannel changeChannel = ChangeChannel(television);
    final ChangeVolume changeVolume = ChangeVolume(television);

    while (true) {
      if (!television.isOn) {
        print('\nTelevision Control:');
        print('1. Turn ON');
        print('2. Back to Devices');

        final command = stdin.readLineSync();
        switch (command) {
          case '1':
            invoker.executeCommand(TurnOnCommand(device));
            break;
          case '2':
            return;
          default:
            print('Invalid Command!');
        }
      } else {
        print('\nTelevision Control:');
        print('1. Change Channel');
        print('2. Increase Volume');
        print('3. Decrease Volume');
        print('4. Turn OFF');
        print('5. Undo Last Action');
        print('6. Back to Devices');

        final command = stdin.readLineSync();
        switch (command) {
          case '1':
            print('Enter the channel number:');
            final channelInput = stdin.readLineSync();
            final int? channel = int.tryParse(channelInput ?? '');
            if (channel != null) {
              invoker.executeCommand(ChangeChannelCommand(changeChannel, channel));
            } else {
              print('Invalid channel number!');
            }
            break;
          case '2':
            print('Enter the volume increase amount:');
            final increaseInput = stdin.readLineSync();
            final int? increaseAmount = int.tryParse(increaseInput ?? '');
            if (increaseAmount != null) {
              invoker.executeCommand(IncreaseVolumeCommand(changeVolume, increaseAmount));
            } else {
              print('Invalid volume increase amount!');
            }
            break;
          case '3':
            print('Enter the volume decrease amount:');
            final decreaseInput = stdin.readLineSync();
            final int? decreaseAmount = int.tryParse(decreaseInput ?? '');
            if (decreaseAmount != null) {
              invoker.executeCommand(DecreaseVolumeCommand(changeVolume, decreaseAmount));
            } else {
              print('Invalid volume decrease amount!');
            }
            break;
          case '4':
            invoker.executeCommand(TurnOffCommand(device));
            break;
          case '5':
            invoker.undo();
            break;
          case '6':
            return;
          default:
            print('Invalid Command!');
        }
      }
    }
  }
}
