import 'device_status_observer.dart';

class UserInterface implements DeviceStatusObserver {
  @override
  void update(String message) {
    print('User Notification: $message');
  }
}
