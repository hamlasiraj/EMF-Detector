import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainReading extends StatefulWidget {
  const MainReading({super.key});

  @override
  State<MainReading> createState() => _MainReadingState();
}

class _MainReadingState extends State<MainReading> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 20),
        Consumer<MagnitudeController>(
          builder: (context, magnitudeCtr, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: w / 2,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(magnitudeCtr.magnitude.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold))
                  ])),
              SizedBox(
                  width: w / 2,
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('µTesla',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold))
                      ])),
            ],
          ),
        )
      ],
    );
  }
}
