class RobotVacuumSettings {
  final String room;
  final bool isOn;

  // Private Constructor
  RobotVacuumSettings._({
    required this.room,
    required this.isOn,
  });

  @override
  String toString() {
    return 'Room: $room, Is On: $isOn';
  }
}

class RobotVacuumSettingsBuilder {
  String _room = 'Default Room';
  bool _isOn = false;

  // Oda ayarı
  RobotVacuumSettingsBuilder setRooms(String room) {
    _room = room;
    return this;
  }

  // Açık/Kapalı durumu ayarı
  RobotVacuumSettingsBuilder setIsOn(bool isOn) {
    _isOn = isOn;
    return this;
  }

  // RobotVacuumSettings oluştur
  RobotVacuumSettings build() {
    return RobotVacuumSettings._(
      room: _room,
      isOn: _isOn,
    );
  }
}
