import '../devices/television/change_channel.dart';
import 'command.dart';

class ChangeChannelCommand implements Command {
  final ChangeChannel changeChannel;
  final int channel;

  ChangeChannelCommand(this.changeChannel, this.channel);

  @override
  void execute() {
    changeChannel.setChannel(channel);
    print('Channel set to $channel');
  }

  @override
  void undo() {
    print('Undo: Reverting channel change.');
  }
}
