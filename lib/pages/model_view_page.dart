import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart' as sensors;

class ModelViewer extends StatefulWidget {
  const ModelViewer({super.key});

  @override
  State<ModelViewer> createState() => _ModelViewerState();
}

class _ModelViewerState extends State<ModelViewer> {
  bool isAvlbl = false;
  @override
  void initState() {
    super.initState();
    if (!sensors.accelerometerEvents.isBroadcast) {
      isAvlbl = false;
    } else {
      isAvlbl = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isAvlbl
            ? StreamBuilder(
                stream: sensors.accelerometerEvents,
                builder:
                    (final BuildContext context, final AsyncSnapshot snapshot) {
                  String accelerometer = snapshot.data.toString();
                  return Text("Supported\n $accelerometer");
                })
            : const Text('Not Supported'),
      ),
    );
  }
}
