class WashingMachineSettings {
  final String mode;
  final int temperature;
  final int spinSpeed;
  final int duration;

  // Private Constructor
  WashingMachineSettings._({
    required this.mode,
    required this.temperature,
    required this.spinSpeed,
    required this.duration,
  });

  @override
  String toString() {
    return 'Mode: $mode, Temperature: $temperature°C, Spin Speed: $spinSpeed RPM, Duration: $duration seconds';
  }
}

class WashingMachineSettingsBuilder {
  String? _mode;
  int? _temperature;
  int? _spinSpeed;
  int _duration = 0;

  // Mod seçimi
  WashingMachineSettingsBuilder setMode(String mode) {
    _mode = mode;
    switch (mode) {
      case 'Quick Wash':
        _duration = 2; // 20 saniye
        break;
      case 'Daily Wash':
        _duration = 4; // 40 saniye
        break;
      case 'Intensive Wash':
        _duration = 6; // 60 saniye
        break;
      case 'Energy Saving':
        _duration = 5; // 50 saniye
        break;
      default:
        throw ArgumentError('Invalid mode: $mode');
    }
    return this;
  }

  // Sıcaklık ayarı
  WashingMachineSettingsBuilder setTemperature(int temperature) {
    _temperature = temperature;
    return this;
  }

  // Spin hız ayarı
  WashingMachineSettingsBuilder setSpinSpeed(int spinSpeed) {
    _spinSpeed = spinSpeed;
    return this;
  }

  // WashingMachineSettings oluştur
  WashingMachineSettings build() {
    if (_mode == null || _temperature == null || _spinSpeed == null) {
      throw StateError('All fields must be set before building the settings.');
    }
    return WashingMachineSettings._(
      mode: _mode!,
      temperature: _temperature!,
      spinSpeed: _spinSpeed!,
      duration: _duration,
    );
  }
}
