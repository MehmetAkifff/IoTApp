import '../devices/television/change_volume.dart';
import 'command.dart';

class DecreaseVolumeCommand implements Command {
  final ChangeVolume changeVolume;
  final int decreaseAmount;

  DecreaseVolumeCommand(this.changeVolume, this.decreaseAmount);

  @override
  void execute() {
    changeVolume.decreaseVolume(decreaseAmount);
    print('Volume decreased by $decreaseAmount');
  }

  @override
  void undo() {
    changeVolume.increaseVolume(decreaseAmount);
    print('Undo: Volume increased by $decreaseAmount');
  }
}
