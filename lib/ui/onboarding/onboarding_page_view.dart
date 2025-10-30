import 'package:dailyflow/ui/onboarding/onboarding_child_page.dart';
import 'package:dailyflow/ui/ultils/enum/onboarding_page_postion.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          // truyền vào các widget con mà page view muốn hiển thị
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
          ),
        ],
      ),
    );
  }
}
