import 'package:fintness_project/screens/bmi_screen.dart';
import 'package:fintness_project/screens/intro_screen.dart';
import 'package:fintness_project/screens/weather_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // entry point for flutter
  runApp(GlobeApp()); //inflates widget and attaches it to the screen
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen()
      },
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
