import 'package:flutter/material.dart';
import '../devices/device.dart';

class DeviceDetailScreen extends StatefulWidget {
  final Device device;

  const DeviceDetailScreen({Key? key, required this.device}) : super(key: key);

  @override
  _DeviceDetailScreenState createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  final Map<String, dynamic> _settings = {};

  void _applySettings() {
    try {
      widget.device.applySettings(_settings);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Settings applied: $_settings')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Widget _buildSettings(Map<String, dynamic> schema) {
    List<Widget> widgets = [];

    schema.forEach((key, value) {
      if (value is List) {
        // Dropdown seçimi
        widgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$key:', style: const TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _settings[key],
              hint: Text('Select $key'),
              items: value.map<DropdownMenuItem<String>>((v) {
                return DropdownMenuItem(value: v, child: Text(v));
              }).toList(),
              onChanged: (selected) {
                setState(() {
                  _settings[key] = selected;
                });
              },
            ),
          ],
        ));
      } else if (value is Map) {
        // Slider seçimi
        widgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$key:', style: const TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: (_settings[key] ?? value['default']).toDouble(),
              min: value['min'].toDouble(),
              max: value['max'].toDouble(),
              divisions: (value['max'] - value['min']) ~/ 10,
              label: '${_settings[key] ?? value['default']}',
              onChanged: (v) {
                setState(() {
                  _settings[key] = v.toInt();
                });
              },
            ),
          ],
        ));
      }
    });

    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    final schema = widget.device.getSettingsSchema();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device.getName()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device: ${widget.device.getName()}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Status: ${widget.device.isOn() ? "ON" : "OFF"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (widget.device.isOn()) {
                    widget.device.turnOff();
                  } else {
                    widget.device.turnOn();
                  }
                });
              },
              child: Text(widget.device.isOn() ? 'Turn OFF' : 'Turn ON'),
            ),
            const SizedBox(height: 20),
            if (schema != null) ...[
              _buildSettings(schema),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _settings.isNotEmpty ? _applySettings : null,
                child: const Text('Apply Settings'),
              ),
            ] else
              const Text('This device has no configurable settings.'),
          ],
        ),
      ),
    );
  }
}
