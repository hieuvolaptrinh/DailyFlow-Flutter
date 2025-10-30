import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _buildBodyLogo(),
    );
  }

  Widget _buildBodyLogo() {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // co lại theo nội dung giống display flex
          children: [_buildIconSplash(), _buildTextSplash()],
        ),
      ),
    );
  }

  Widget _buildIconSplash() {
    return Image.asset(
      "assets/images/checkIcon.png",
      width: 95,
      height: 95,
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextSplash() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Text(
        "Up todo",
        style: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
