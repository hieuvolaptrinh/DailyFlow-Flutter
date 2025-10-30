import 'package:dailyflow/ui/onboarding/onboarding_page_view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SafeArea(child: OnboardingPageView()),
    );
  }
}
