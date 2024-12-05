import 'device_status_observer.dart';

class NotificationService implements DeviceStatusObserver {
  @override
  void update(String message) {
    print('Notification Service: $message');
  }
}
