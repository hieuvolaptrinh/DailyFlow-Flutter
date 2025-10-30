import 'package:dailyflow/ui/ultils/enum/onboarding_page_postion.dart';
import 'package:flutter/material.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;
  const OnboardingChildPage({super.key, required this.onboardingPagePosition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSkipButton(),
            _buildOnboardingImage(),
            _buildOnboardingPageControl(),
            _buildOnboardingTitleAndContent(),
            _buildOnboardingNextAndPreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Lato",
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      OnboardingPageTitle(this.onboardingPagePosition),
      height: 300,
      width: 300,
      fit: BoxFit.contain,
    );
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(color: Colors.white70),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 4,
            width: 26,
            decoration: BoxDecoration(color: Colors.white),
          ),
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 38, vertical: 70),
      child: Column(
        children: [
          Text(
            OnboardingPageTitle(this.onboardingPagePosition),
            style: TextStyle(
              fontFamily: "Lato",
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 42),
          Text(
            OnboardingPageContent(this.onboardingPagePosition),
            style: TextStyle(
              fontFamily: "Lato",
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndPreButton() {
    return Container(
      margin: EdgeInsets.only(top: 80, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // căn 2 nút 2 bên
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Back",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
