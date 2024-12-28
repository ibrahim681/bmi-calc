import 'package:bmi/screens/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: const Color.fromARGB(255, 21, 22, 26),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,      home: const SplashPage(),
    );
  }
}
