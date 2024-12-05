import '../devices/device.dart';
import '../singleton/iot_controller.dart';

abstract class DeviceController {
  void controlDevice(IoTController controller, Device device);
}
