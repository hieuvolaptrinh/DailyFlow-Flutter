import 'package:dailyflow/ui/onboarding/widget/onboarding_child_page.dart';
import 'package:dailyflow/core/utils/enum/onboarding_page_postion.dart';
import 'package:dailyflow/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {
              print("cút ");
            },
            skipOnPressed: () {
              _goToWelcomPage();
              _markOnboardingComplete();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            backOnPressed: () {
              _pageController.jumpToPage(0);
            },
            skipOnPressed: () {
              _goToWelcomPage();
              _markOnboardingComplete();
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              _goToWelcomPage();
              _markOnboardingComplete();
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
              _goToWelcomPage();
              _markOnboardingComplete();
            },
          ),
        ],
      ),
    );
  }

  void _goToWelcomPage() {
    Navigator.pushNamed(
      context,
      Routes.welcome,
      arguments: {'isFirstTimeInstallApp': true},
    );
  }

  Future<void> _markOnboardingComplete() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("kOnboardingCompleted", true);
    } catch (e) {
      return;
    }
  }
}
