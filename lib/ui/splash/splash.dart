import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Container(
        color: Colors.green,
        child: Column(
          mainAxisSize: MainAxisSize.min, // co lại theo nội dung
          children: [
            Image.asset(
              "assets/images/checkIcon.png",
              width: 95,
              height: 95,
              fit: BoxFit.contain,
            ),
            const Text(
              "oke test",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
