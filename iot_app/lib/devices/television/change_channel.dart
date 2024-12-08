import 'television.dart';

class ChangeChannel {
  final Television television;

  ChangeChannel(this.television);

  void setChannel(int channel) {
    if (!television.isOn()) {
      print('Error: Cannot change the channel while the television is OFF.');
      return;
    }

    final settingsSchema = television.getSettingsSchema();
    if (settingsSchema == null || !settingsSchema.containsKey("Channel")) {
      print('Error: Channel setting is not supported by this television.');
      return;
    }

    final minChannel = settingsSchema["Channel"]["min"];
    final maxChannel = settingsSchema["Channel"]["max"];

    if (channel < minChannel || channel > maxChannel) {
      print('Invalid channel number. Please select a channel between $minChannel and $maxChannel.');
    } else {
      print('Changing to channel $channel');
      // Kanal değiştirme işlemi burada gerçekleştirilir
      television.applySettings({
        ...television.getSettingsSchema() ?? {},
        "Channel": channel,
      });
    }
  }
}
