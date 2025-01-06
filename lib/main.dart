import 'package:calculator/screens/input_screen.dart';
import 'package:calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Anutio Calculator',
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
        debugShowCheckedModeBanner: false,
        routerConfig: router

        // home: const SplashScreen(),
        // initialRoute: SplashScreen.id,
        // routes: {
        //   InputScreen.id: (context) => const InputScreen(),
        //   ResultScreen.id: (context) => const ResultScreen(
        //         num1: 10,
        //       ),
        // },
        // onGenerateRoute: Ap,
        );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const SplashScreen(),
      routes: [
        GoRoute(
          path: '/input_screen',
          name: 'input_screen',
          builder: (_, __) => const InputScreen(),
        ),
        GoRoute(
          path: '/result_screen',
          name: 'result_screen',
          builder: (_, state) {
            final value = state.extra as int?;

            return ResultScreen(
              num1: value!,
            );
          },
        ),
      ],
    ),
  ],
);
