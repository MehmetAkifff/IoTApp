import '../devices/television/change_volume.dart';
import 'command.dart';

class IncreaseVolumeCommand implements Command {
  final ChangeVolume changeVolume;
  final int increaseAmount;

  IncreaseVolumeCommand(this.changeVolume, this.increaseAmount);

  @override
  void execute() {
    changeVolume.increaseVolume(increaseAmount);
    print('Volume increased by $increaseAmount');
  }

  @override
  void undo() {
    changeVolume.decreaseVolume(increaseAmount);
    print('Undo: Volume decreased by $increaseAmount');
  }
}
