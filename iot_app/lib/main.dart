import 'package:flutter/material.dart';
import 'controllers/device_control_manager.dart';
import 'devices/device.dart';
import 'devices/air_conditioning/air_conditioner.dart';
import 'devices/dish_washer/dish_washer.dart';
import 'devices/dryer_machine/dryer_machine.dart';
import 'devices/robot_vacuum/robot_vacuum.dart';
import 'devices/television/television.dart';
import 'devices/washing_machine/washing_machine.dart';
import 'devices/garage_door.dart';
import 'devices/light_bulb.dart';
import 'observer/user_interface.dart';
import 'singleton/iot_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Controller',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final IoTController controller = IoTController.getInstance();
  final DeviceControlManager controlManager = DeviceControlManager();
  final UserInterface ui = UserInterface();

  @override
  void initState() {
    super.initState();

    // Cihazları oluştur ve kaydet
    controller.registerDevice(LightBulb());
    controller.registerDevice(GarageDoor());
    controller.registerDevice(Television());
    controller.registerDevice(RobotVacuum());
    controller.registerDevice(WashingMachine());
    controller.registerDevice(DryerMachine());
    controller.registerDevice(DishWasher());
    controller.registerDevice(AirConditioner());

    // Gözlemci ekle
    controller.addObserver(ui);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IoT Controller'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('List Devices'),
            onTap: () => _listDevices(context),
          ),
          ListTile(
            title: Text('Exit'),
            onTap: () => _exitApp(),
          ),
        ],
      ),
    );
  }

  void _listDevices(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceListPage(controller: controller, controlManager: controlManager),
      ),
    );
  }

  void _exitApp() {
    // Uygulamayı sonlandırma
    print('Exiting...');
  }
}

class DeviceListPage extends StatelessWidget {
  final IoTController controller;
  final DeviceControlManager controlManager;

  DeviceListPage({required this.controller, required this.controlManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
      ),
      body: ListView.builder(
        itemCount: controller.getDevices().length + 1,
        itemBuilder: (context, index) {
          if (index == controller.getDevices().length) {
            return ListTile(
              title: Text('Back to Main Menu'),
              onTap: () {
                Navigator.pop(context);
              },
            );
          }

          final device = controller.getDevices()[index];
          return ListTile(
            title: Text(device.name),
            onTap: () => _controlDevice(context, device),
          );
        },
      ),
    );
  }

  void _controlDevice(BuildContext context, Device device) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceControlPage(device: device, controlManager: controlManager),
      ),
    );
  }
}

class DeviceControlPage extends StatelessWidget {
  final Device device;
  final DeviceControlManager controlManager;

  DeviceControlPage({required this.device, required this.controlManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Cihaz kontrol mantığını çalıştır
            controlManager.controlDevice(IoTController.getInstance(), device);
          },
          child: Text('Control ${device.name}'),
        ),
      ),
    );
  }
}
