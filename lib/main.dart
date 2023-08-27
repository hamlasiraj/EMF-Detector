import 'package:emf_detector/home.dart';
import 'package:emf_detector/models/magnitudeprovider.dart';
import 'package:emf_detector/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MagnitudeController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "DMSans",
          scaffoldBackgroundColor: AppColors.primaryColor,
        ),
        home: const Home(),
      ),
    );
  }
}
