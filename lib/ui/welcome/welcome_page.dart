import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            // Title and subtitle
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Welcome to Daily Flow",
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
              child: const Text(
                "Please login to your account or create\nnew account to continue",
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF8687E7),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(
                        color: Color(0XFF8687E7),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      "CREATE ACCOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
