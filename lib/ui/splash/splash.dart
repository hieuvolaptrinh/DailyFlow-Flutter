import 'package:dailyflow/ui/onboarding/onboarding_page_view.dart';
import 'package:dailyflow/ui/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _checkAppState(BuildContext context) async {
    final isCompleted = await _isOnboardingCompleted();
    if (isCompleted) {
      // di chuyển đến màn hình welcom
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomePage(isFirstTimeInstallApp: false);
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnboardingPageView();
          },
        ),
      );
    }
  }

  Future<bool> _isOnboardingCompleted() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool("kOnboardingCompleted") ?? false;
      return result;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAppState(context);
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
