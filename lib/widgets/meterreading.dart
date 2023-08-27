import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:emf_detector/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MeterReading extends StatefulWidget {
  const MeterReading({super.key});

  @override
  State<MeterReading> createState() => _MeterReadingState();
}

class _MeterReadingState extends State<MeterReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Consumer<MagnitudeController>(
          builder: (context, magnitudeCrt, child) => SfRadialGauge(
            axes: [
              RadialAxis(
                minimum: 0,
                maximum: 1000,
                labelOffset: 20,
                tickOffset: 20,
                ranges: [
                  GaugeRange(
                    startValue: 0,
                    endValue: 200,
                    color: AppColors.green,
                    label: "Safe",
                    labelStyle: const GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    startWidth: 25,
                    endWidth: 25,
                  ),
                  GaugeRange(
                    startValue: 200,
                    endValue: 500,
                    color: AppColors.orange,
                    label: "Moderate",
                    labelStyle: const GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    startWidth: 25,
                    endWidth: 25,
                  ),
                  GaugeRange(
                    startValue: 500,
                    endValue: 1000,
                    color: AppColors.red,
                    label: "Danger",
                    labelStyle: const GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    startWidth: 25,
                    endWidth: 25,
                  )
                ],
                pointers: [NeedlePointer(value: magnitudeCrt.magnitude)],
                annotations: [
                  GaugeAnnotation(
                    widget: SizedBox(
                      child: Text(magnitudeCrt.magnitude.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    angle: 90,
                    positionFactor: 0.5,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
