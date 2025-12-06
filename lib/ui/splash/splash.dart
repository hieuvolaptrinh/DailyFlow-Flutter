import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Không cần navigation vì initialRoute đã là Routes.main
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: _buildBodyLogo(context),
      ),
    );
  }

  Widget _buildBodyLogo(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // co lại theo nội dung giống display flex
          children: [_buildIconSplash(), _buildTextSplash(context)],
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

  Widget _buildTextSplash(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        context.tr('splash.app_name'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
