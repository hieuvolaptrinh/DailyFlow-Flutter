import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dailyflow/ui/login/login_page.dart';
import 'package:dailyflow/ui/register/register_page.dart';

class WelcomePage extends StatelessWidget {
  final bool isFirstTimeInstallApp;
  const WelcomePage({super.key, required this.isFirstTimeInstallApp});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                Spacer(),
                _buttonChangeLanguage(context),
              ],
            ),

            // Title and subtitle
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                context.tr('welcome_page.title'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                context.tr('welcome_page.desc'),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 24),
              ),
            ),
            // Spacer để đẩy nút xuống dưới cùng
            const Spacer(),
            // Login and Create Account buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buttonLogin(context),
                  SizedBox(height: 16),
                  _buttonCreateAccount(context),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // create account button
  Widget _buttonCreateAccount(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Color(0XFF8687E7), width: 2),
      ),
      child: Text(
        context.tr('welcome_page.create_account'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Login button
  Widget _buttonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF8687E7),
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        context.tr('welcome_page.login'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Button change language
  Widget _buttonChangeLanguage(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final currentLocale = context.locale.toString();
        if (currentLocale == "en") {
          context.setLocale(Locale("vi"));
        } else {
          context.setLocale(Locale("en"));
        }
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Color(0XFF8687E7), width: 2),
      ),
      child: Text(
        context.tr('welcome_page.change_language'),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
