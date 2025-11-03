import 'package:dailyflow/ui/main/main_page.dart';
import 'package:dailyflow/ui/onboarding/onboarding_page_view.dart';
import 'package:dailyflow/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:dailyflow/ui/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 88, 93, 240),
        ),
        fontFamily: "Lato",
      ),
      home: SafeArea(child: SplashScreen()),
      // home: SafeArea(child: MainPage()),
      // home: SafeArea(child: WelcomePage()),
    );
  }
}
