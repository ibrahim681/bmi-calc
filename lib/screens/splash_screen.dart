import 'package:flutter/material.dart';
import 'package:calculator/screens/input_screen.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash_screen';

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          //  Navigator.pushReplacementNamed(context, InputScreen.id);

          // Navigator.push(
          //   context,
          //   CupertinoPageRoute<void>(
          //     builder: (BuildContext context) => const InputScreen(),
          //   ),
          // );

          // pushScreen(
          //   const InputScreen(),
          //   context: context,
          // );

          context.pushNamed(
            InputScreen.id,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Anutio Splash',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome to the BMI calculator',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
