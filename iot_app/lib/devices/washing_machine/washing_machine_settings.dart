class WashingMachineSettings {
  final String mode;
  final int temperature;
  final int spinSpeed;
  final int duration;

  // Constructor
  WashingMachineSettings({
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

  // Predefined modes and their corresponding durations
  static const Map<String, int> predefinedModes = {
    'Quick Wash': 20, // Duration in seconds
    'Daily Wash': 40,
    'Intensive Wash': 60,
    'Energy Saving': 50,
  };

  /// Set the mode and automatically configure its duration
  WashingMachineSettingsBuilder setMode(String mode) {
    if (!predefinedModes.containsKey(mode)) {
      throw ArgumentError('Invalid mode: $mode');
    }
    _mode = mode;
    _duration = predefinedModes[mode]!;
    return this;
  }

  /// Set the washing temperature
  WashingMachineSettingsBuilder setTemperature(int temperature) {
    if (temperature < 0 || temperature > 90) {
      throw ArgumentError('Temperature must be between 0 and 90°C.');
    }
    _temperature = temperature;
    return this;
  }

  /// Set the spin speed
  WashingMachineSettingsBuilder setSpinSpeed(int spinSpeed) {
    if (spinSpeed < 400 || spinSpeed > 1600) {
      throw ArgumentError('Spin speed must be between 400 and 1600 RPM.');
    }
    _spinSpeed = spinSpeed;
    return this;
  }

  /// Build the WashingMachineSettings object
  WashingMachineSettings build() {
    if (_mode == null) {
      throw StateError('Mode must be set before building the settings.');
    }
    if (_temperature == null) {
      throw StateError('Temperature must be set before building the settings.');
    }
    if (_spinSpeed == null) {
      throw StateError('Spin speed must be set before building the settings.');
    }

    return WashingMachineSettings(
      mode: _mode!,
      temperature: _temperature!,
      spinSpeed: _spinSpeed!,
      duration: _duration,
    );
  }
}
