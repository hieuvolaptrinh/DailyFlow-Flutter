enum OnboardingPagePosition { page1, page2, page3 }

// extension để customize kiểu dữ liệu
extension OnboardingPagePositionExtension on OnboardingPagePosition {
  String onboardingPageImage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'assets/images/onboarding1.png';
      case OnboardingPagePosition.page2:
        return 'assets/images/onboarding2.png';
      case OnboardingPagePosition.page3:
        return 'assets/images/onboarding3.png';
    }
  }
}

String OnboardingPageTitle(OnboardingPagePosition position) {
  switch (position) {
    case OnboardingPagePosition.page1:
      return 'onboarding.page1.title';
    case OnboardingPagePosition.page2:
      return 'onboarding.page2.title';
    case OnboardingPagePosition.page3:
      return 'onboarding.page3.title';
  }
}

String OnboardingPageContent(OnboardingPagePosition position) {
  switch (position) {
    case OnboardingPagePosition.page1:
      return 'onboarding.page1.content';
    case OnboardingPagePosition.page2:
      return 'onboarding.page2.content';
    case OnboardingPagePosition.page3:
      return 'onboarding.page3.content';
  }
}
