import 'package:flutter/material.dart';
import 'package:iot_app/devices/air_conditioning/air_conditioner.dart';
import 'package:iot_app/devices/dish_washer/dish_washer.dart';
import 'package:iot_app/devices/dryer_machine/dryer_machine.dart';
import 'package:iot_app/devices/garage_door.dart';
import 'package:iot_app/devices/robot_vacuum/robot_vacuum.dart';
import 'package:iot_app/devices/television/television.dart';
import '../devices/device.dart';
import '../devices/light_bulb.dart';
import '../devices/washing_machine/washing_machine.dart';
import 'device_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Device> devices = [
    AirConditioner(),
    DishWasher(),
    DryerMachine(),
    RobotVacuum(),
    Television(),
    WashingMachine(),
    GarageDoor(),
    LightBulb(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Devices'),
      ),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index].getName()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeviceDetailScreen(device: devices[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
