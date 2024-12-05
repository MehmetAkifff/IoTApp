class DryerMachineSettings {
  final String mode;
  final int temperature;
  final int degreeOfDry;
  final int duration;

  // Private Constructor
  DryerMachineSettings._({
    required this.mode,
    required this.temperature,
    required this.degreeOfDry,
    required this.duration,
  });

  @override
  String toString() {
    return 'Mode: $mode, Temperature: $temperature°C, Degree of Dryness: $degreeOfDry level, Duration: $duration seconds';
  }
}

class DryerMachineSettingsBuilder {
  String? _mode;
  int? _temperature;
  int? _degreeOfDry;
  int _duration = 0;

  // Mod seçimi
  DryerMachineSettingsBuilder setMode(String mode) {
    _mode = mode;
    switch (mode) {
      case 'Quick Dry':
        _duration = 1; // 20 seconds
        break;
      case 'Ventilation Dry':
        _duration = 2; // 40 seconds
        break;
      case 'Eco Dry':
        _duration = 3; // 60 seconds
        break;
      case 'Synthetic Dry':
        _duration = 4; // 50 seconds
        break;
      default:
        throw ArgumentError('Invalid mode: $mode');
    }
    return this;
  }

  // Sıcaklık ayarı
  DryerMachineSettingsBuilder setTemperature(int temperature) {
    _temperature = temperature;
    return this;
  }

  // Kuruluk seviyesi
  DryerMachineSettingsBuilder setDegreeOfDry(int degreeOfDry) {
    _degreeOfDry = degreeOfDry;
    return this;
  }

  // Build DryerMachineSettings instance
  DryerMachineSettings build() {
    if (_mode == null || _temperature == null || _degreeOfDry == null) {
      throw StateError('All fields must be set before building the settings.');
    }
    return DryerMachineSettings._(
      mode: _mode!,
      temperature: _temperature!,
      degreeOfDry: _degreeOfDry!,
      duration: _duration,
    );
  }
}
