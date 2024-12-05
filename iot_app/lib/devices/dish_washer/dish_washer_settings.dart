class DishWasherSettings {
  final String mode; // Yıkama modu
  final int temperature; // Sıcaklık
  final int duration; // Süre (saniye cinsinden)

  // Private Constructor
  DishWasherSettings._({
    required this.mode,
    required this.temperature,
    required this.duration,
  });

  @override
  String toString() {
    return 'Mode: $mode, Temperature: $temperature°C, Duration: $duration seconds';
  }
}

class DishWasherSettingsBuilder {
  String? _mode;
  int? _temperature;
  int _duration = 0;

  // Mod seçimi
  DishWasherSettingsBuilder setMode(String mode) {
    _mode = mode;
    switch (mode) {
      case 'Quick Wash':
        _duration = 2; // 2 dakika
        break;
      case 'Pre-Wash':
        _duration = 2; // 2 dakika
        break;
      case 'Intensive':
        _duration = 4; // 4 dakika
        break;
      case 'Half Load Mode':
        _duration = 2; // 2 dakika
        break;
      case 'Standard Wash':
        _duration = 3; // 3 dakika
        break;
      case 'Extra Rinse':
        _duration = 6; // 6 dakika
        break;
      default:
        throw ArgumentError('Invalid mode: $mode');
    }
    return this;
  }

  // Sıcaklık ayarı
  DishWasherSettingsBuilder setTemperature(int temperature) {
    if (temperature < 0 || temperature > 100) {
      throw ArgumentError('Temperature must be between 0°C and 100°C.');
    }
    _temperature = temperature;
    return this;
  }

  // Build DishWasherSettings instance
  DishWasherSettings build() {
    if (_mode == null || _temperature == null) {
      throw StateError('All fields must be set before building the settings.');
    }
    return DishWasherSettings._(
      mode: _mode!,
      temperature: _temperature!,
      duration: _duration,
    );
  }
}
