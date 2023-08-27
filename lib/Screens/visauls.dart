import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:emf_detector/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Visuals extends StatefulWidget {
  const Visuals({super.key});

  @override
  State<Visuals> createState() => _VisualsState();
}

class _VisualsState extends State<Visuals> {
  late ChartSeriesController _chartSeriesCtr;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visuals"),
        backgroundColor: AppColors.secondColor,
        foregroundColor: Colors.black,
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Card(
              color: AppColors.secondColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<MagnitudeController>(
                builder: (context, magnitudeCtr, child) => SfCartesianChart(
                  title: ChartTitle(text: "x y z with time"),
                  legend: const Legend(
                      isVisible: true, title: LegendTitle(text: "Legend")),
                  series: <LineSeries<LiveData, int>>[
                    //x
                    LineSeries<LiveData, int>(
                      legendItemText: 'x',
                      onRendererCreated: (controller) {
                        _chartSeriesCtr = controller;
                      },
                      dataSource: magnitudeCtr.values,
                      color: AppColors.red,
                      xValueMapper: (LiveData value, _) => value.time,
                      yValueMapper: (LiveData value, _) => value.x,
                    ),
                    //y
                    LineSeries<LiveData, int>(
                      legendItemText: 'y',
                      onRendererCreated: (controller) {
                        _chartSeriesCtr = controller;
                      },
                      dataSource: magnitudeCtr.values,
                      color: AppColors.blue,
                      xValueMapper: (LiveData value, _) => value.time,
                      yValueMapper: (LiveData value, _) => value.y,
                    ),
                    //z
                    LineSeries<LiveData, int>(
                      legendItemText: 'z',
                      onRendererCreated: (controller) {
                        _chartSeriesCtr = controller;
                      },
                      dataSource: magnitudeCtr.values,
                      color: AppColors.green,
                      xValueMapper: (LiveData value, _) => value.time,
                      yValueMapper: (LiveData value, _) => value.z,
                    )
                  ],
                  primaryXAxis: NumericAxis(
                      isVisible: true,
                      axisLine: const AxisLine(color: Colors.black38),
                      majorGridLines: const MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      majorTickLines:
                          const MajorTickLines(color: Colors.black38),
                      interval: 3,
                      title: AxisTitle(text: "Time(s)")),
                  primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      majorGridLines:
                          const MajorGridLines(color: Colors.black38),
                      majorTickLines: const MajorTickLines(size: 0),
                      title: AxisTitle(text: "µTesla")),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
