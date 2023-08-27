import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:emf_detector/widgets/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class XYZReading extends StatefulWidget {
  const XYZReading({super.key});

  @override
  State<XYZReading> createState() => _XYZReadingState();
}

class _XYZReadingState extends State<XYZReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Consumer<MagnitudeController>(
          builder: (context, magnitudeCtr, child) =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            customText("x: ${magnitudeCtr.x.toStringAsFixed(2)}"),
            customText("z: ${magnitudeCtr.z.toStringAsFixed(2)}"),
            customText("y: ${magnitudeCtr.y.toStringAsFixed(2)}")
          ]),
        )
      ],
    );
  }
}
