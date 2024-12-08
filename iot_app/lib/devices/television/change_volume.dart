import 'television.dart';

class ChangeVolume {
  final Television television;

  ChangeVolume(this.television);

  void increaseVolume(int amount) {
    if (!television.isOn()) {
      print('Error: Cannot increase volume while the television is OFF.');
      return;
    }

    final settingsSchema = television.getSettingsSchema();
    if (settingsSchema == null || !settingsSchema.containsKey("Volume")) {
      print('Error: Volume setting is not supported by this television.');
      return;
    }

    final currentVolume = television.getSettingsSchema()?["Volume"]["default"] ?? 50;
    final maxVolume = settingsSchema["Volume"]["max"];
    final newVolume = (currentVolume + amount).clamp(0, maxVolume);

    print('Increasing volume to $newVolume');
    // Ses artırma işlemi burada gerçekleştirilir
    television.applySettings({
      ...television.getSettingsSchema() ?? {},
      "Volume": newVolume,
    });
  }

  void decreaseVolume(int amount) {
    if (!television.isOn()) {
      print('Error: Cannot decrease volume while the television is OFF.');
      return;
    }

    final settingsSchema = television.getSettingsSchema();
    if (settingsSchema == null || !settingsSchema.containsKey("Volume")) {
      print('Error: Volume setting is not supported by this television.');
      return;
    }

    final currentVolume = television.getSettingsSchema()?["Volume"]["default"] ?? 50;
    final minVolume = settingsSchema["Volume"]["min"];
    final newVolume = (currentVolume - amount).clamp(minVolume, 100);

    print('Decreasing volume to $newVolume');
    // Ses azaltma işlemi burada gerçekleştirilir
    television.applySettings({
      ...television.getSettingsSchema() ?? {},
      "Volume": newVolume,
    });
  }
}
