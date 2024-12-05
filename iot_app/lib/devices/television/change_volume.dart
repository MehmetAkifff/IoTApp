import 'television.dart';

class ChangeVolume {
  final Television television;

  ChangeVolume(this.television);

  void increaseVolume(int amount) {
    if (!television.isOn) {
      print('Error: Cannot increase volume while the television is OFF.');
      return;
    }
    print('Increasing volume by $amount');
    // Ses artırma işlemi burada gerçekleştirilebilir
  }

  void decreaseVolume(int amount) {
    if (!television.isOn) {
      print('Error: Cannot decrease volume while the television is OFF.');
      return;
    }
    print('Decreasing volume by $amount');
    // Ses azaltma işlemi burada gerçekleştirilebilir
  }
}
