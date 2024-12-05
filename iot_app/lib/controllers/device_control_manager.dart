import 'dart:collection';
import '../devices/device.dart';
import '../devices/garage_door.dart';
import '../devices/light_bulb.dart';
import '../devices/air_conditioning/air_conditioner.dart';
import '../devices/dish_washer/dish_washer.dart';
import '../devices/dryer_machine/dryer_machine.dart';
import '../devices/robot_vacuum/robot_vacuum.dart';
import '../devices/television/television.dart';
import '../devices/washing_machine/washing_machine.dart';
import '../singleton/iot_controller.dart';
import 'device_controller.dart';
import 'air_conditioner_controller.dart';
import 'dish_washer_controller.dart';
import 'dryer_machine_controller.dart';
import 'garage_door_controller.dart';
import 'light_bulb_controller.dart';
import 'robot_vacuum_controller.dart';
import 'television_controller.dart';
import 'washing_machine_controller.dart';

class DeviceControlManager {
  final Map<Type, DeviceController> _controllerMap = HashMap<Type, DeviceController>();

  DeviceControlManager() {
    // Her cihaz türü için ilgili kontrol sınıfını kaydet
    _controllerMap[Television] = TelevisionController();
    _controllerMap[RobotVacuum] = RobotVacuumController();
    _controllerMap[WashingMachine] = WashingMachineController();
    _controllerMap[DryerMachine] = DryerMachineController();
    _controllerMap[DishWasher] = DishWasherController();
    _controllerMap[AirConditioner] = AirConditionerController();
    _controllerMap[GarageDoor] = GarageDoorController();
    _controllerMap[LightBulb] = LightBulbController();

    // Diğer cihazlar için kontrol sınıflarını ekleyebilirsiniz.
  }

  void controlDevice(IoTController controller, Device device) {
    final DeviceController? deviceController = _controllerMap[device.runtimeType];
    if (deviceController != null) {
      deviceController.controlDevice(controller, device);
    } else {
      print('No controller available for this device.');
    }
  }
}
