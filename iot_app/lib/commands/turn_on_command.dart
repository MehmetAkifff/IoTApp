import '../devices/device.dart';
import 'command.dart';

class TurnOnCommand implements Command {
  final Device device;

  TurnOnCommand(this.device);

  @override
  void execute() {
    device.turnOn();
  }

  @override
  void undo() {
    device.turnOff();
  }
}
