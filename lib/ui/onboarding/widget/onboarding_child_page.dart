import 'package:dailyflow/core/utils/enum/onboarding_page_postion.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingChildPage extends StatelessWidget {
  final OnboardingPagePosition onboardingPagePosition;

  final VoidCallback nextOnPressed;
  final VoidCallback backOnPressed; // có thể truyền hoạt không

  final VoidCallback skipOnPressed;

  const OnboardingChildPage({
    super.key,
    required this.onboardingPagePosition,
    required this.nextOnPressed,
    required this.backOnPressed,
    required this.skipOnPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1E1E1E),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSkipButton(context),
              _buildOnboardingImage(),
              _buildOnboardingPageControl(),
              _buildOnboardingTitleAndContent(context),
              _buildOnboardingNextAndPreButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: () {
          skipOnPressed.call();
        },
        child: Text(
          context.tr('onboarding.skip'),
          style: const TextStyle(
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
      onboardingPagePosition.onboardingPageImage(),

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
            decoration: BoxDecoration(
              color: OnboardingPagePosition.page1 == onboardingPagePosition
                  ? Colors.white
                  : Colors.white54,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: OnboardingPagePosition.page2 == onboardingPagePosition
                  ? Colors.white
                  : Colors.white54,
            ),
          ),
          Container(
            height: 4,
            width: 26,
            decoration: BoxDecoration(
              color: OnboardingPagePosition.page3 == onboardingPagePosition
                  ? Colors.white
                  : Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 38, vertical: 70),
      child: Column(
        children: [
          Text(
            context.tr(OnboardingPageTitle(onboardingPagePosition)),
            style: TextStyle(
              fontFamily: "Lato",
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 42),
          Text(
            context.tr(OnboardingPageContent(onboardingPagePosition)),
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

  Widget _buildOnboardingNextAndPreButton(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 20, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // căn 2 nút 2 bên
        children: [
          TextButton(
            onPressed: () {
              backOnPressed.call();
            },
            child: Text(
              context.tr('onboarding.back'),
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              nextOnPressed.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8875FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              onboardingPagePosition == OnboardingPagePosition.page3
                  ? context.tr('onboarding.get_started')
                  : context.tr('onboarding.next'),
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
