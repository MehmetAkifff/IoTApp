class AirConditionerSettings {
  final String mode; // Mod (cooling, heating, etc.)
  final String fanSpeed; // Fan Hızı (low, medium, high, auto)
  final int temperature; // Sıcaklık
  final int duration; // Süre (dakika cinsinden)

  // Constructor (Private)
  AirConditionerSettings._({
    required this.mode,
    required this.fanSpeed,
    required this.temperature,
    required this.duration,
  });

  @override
  String toString() {
    return 'Mode: $mode, Fan Speed: $fanSpeed, Temperature: $temperature°C, Duration: $duration minutes';
  }
}

class AirConditionerSettingsBuilder {
  String? mode;
  String? fanSpeed;
  int? temperature;
  int duration = 0;

  // Mod seçimi
  AirConditionerSettingsBuilder setMode(String mode) {
    this.mode = mode;
    switch (mode) {
      case 'Cooling':
        duration = 3;
        break;
      case 'Heating':
        duration = 4;
        break;
      case 'Fan':
        duration = 2;
        break;
      case 'Dehumidify':
        duration = 2;
        break;
      case 'Auto':
        duration = 6;
        break;
      default:
        throw ArgumentError('Invalid mode: $mode');
    }
    return this;
  }

  // Fan hızını ayarla
  AirConditionerSettingsBuilder setFanSpeed(String fanSpeed) {
    if (!['Low', 'Medium', 'High', 'Auto'].contains(fanSpeed)) {
      throw ArgumentError('Invalid fan speed: $fanSpeed');
    }
    this.fanSpeed = fanSpeed;
    return this;
  }

  // Sıcaklık ayarı
  AirConditionerSettingsBuilder setTemperature(int temperature) {
    if (temperature < 16 || temperature > 30) {
      throw ArgumentError('Temperature must be between 16°C and 30°C.');
    }
    this.temperature = temperature;
    return this;
  }

  // Ayarları oluştur
  AirConditionerSettings build() {
    if (mode == null || fanSpeed == null || temperature == null) {
      throw StateError('All fields must be set before building the settings.');
    }
    return AirConditionerSettings._(
      mode: mode!,
      fanSpeed: fanSpeed!,
      temperature: temperature!,
      duration: duration,
    );
  }
}
