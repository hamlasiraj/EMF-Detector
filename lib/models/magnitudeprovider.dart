import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnitudeController extends ChangeNotifier {
  double x = 0;
  double y = 0;
  double z = 0;
  double magnitude = 0;
  int time = 0;
  List<LiveData> values = [];

  Vector3 magnetometer = Vector3.zero();

  newChangeValues(BuildContext context) {
    magnetometerEvents.listen((event) {
      magnetometer.setValues(event.x, event.y, event.z);
      x = magnetometer.x;
      y = magnetometer.y;
      z = magnetometer.z;
      magnitude = sqrt((pow(magnetometer.x, 2) +
          pow(magnetometer.y, 2) +
          pow(magnetometer.z, 2)));
      values.add(LiveData(x, y, z, time++));
    }, onError: (e) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Sensor Not Found"),
              titleTextStyle:
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              content: Text(
                  "It seems that your device doesn't support Magnetometer Sensor"),
              contentTextStyle: TextStyle(fontWeight: FontWeight.w600),
            );
          });
    }, cancelOnError: true);
    notifyListeners();
  }
}

class LiveData {
  const LiveData(this.x, this.y, this.z, this.time);
  final double x;
  final double y;
  final double z;
  final int time;
}
