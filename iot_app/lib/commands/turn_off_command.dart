import '../devices/device.dart';
import 'command.dart';

class TurnOffCommand implements Command {
  final Device device;

  TurnOffCommand(this.device);

  @override
  void execute() {
    device.turnOff();
  }

  @override
  void undo() {
    device.turnOn();
  }
}
