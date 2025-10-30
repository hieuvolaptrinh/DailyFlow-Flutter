import 'package:dailyflow/ui/onboarding/onboarding_child_page.dart';
import 'package:dailyflow/ui/ultils/enum/onboarding_page_postion.dart';
import 'package:flutter/material.dart';

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
          // truyền vào các widget con mà page view muốn hiển thị
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            backOnPressed: () {
              print("cút ");
            },
            skipOnPressed: () {
              print("welcome to home page");
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
              print("welcome to home page");
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              print("hello hiếu võ lập trình");
            },
            backOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipOnPressed: () {
              print("welcome to home page");
            },
          ),
        ],
      ),
    );
  }
}
