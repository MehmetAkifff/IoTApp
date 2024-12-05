import 'television.dart';

class ChangeChannel {
  final Television television;

  ChangeChannel(this.television);

  void setChannel(int channel) {
    if (!television.isOn) {
      print('Error: Cannot change the channel while the television is OFF.');
      return;
    }
    if (channel > 0) {
      print('Changing to channel $channel');
      // Kanal değiştirme işlemi burada gerçekleştirilebilir
    } else {
      print('Invalid channel number. Please try again.');
    }
  }
}
