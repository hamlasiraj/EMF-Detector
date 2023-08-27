import 'package:emf_detector/Screens/visauls.dart';
import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:emf_detector/widgets/customwidget.dart';
import 'package:emf_detector/widgets/mainreading.dart';
import 'package:emf_detector/widgets/meterreading.dart';
import 'package:emf_detector/widgets/xyzreading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MainReading(),
              const XYZReading(),
              const MeterReading(),
              customButton(context, "Visualize", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Visuals(),
                    ));
              }),
              const SizedBox(height: 10),
              Consumer<MagnitudeController>(
                builder: (context, magnitudeCtr, child) =>
                    customButton(context, "Start", () {
                  magnitudeCtr.newChangeValues(context);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//Container(
          