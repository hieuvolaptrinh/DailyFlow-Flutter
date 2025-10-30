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
      return 'Manage your tasks';
    case OnboardingPagePosition.page2:
      return 'Create daily routine';
    case OnboardingPagePosition.page3:
      return 'Organize your tasks';
  }
}

String OnboardingPageContent(OnboardingPagePosition position) {
  switch (position) {
    case OnboardingPagePosition.page1:
      return 'You can easily manage all of your daily tasks in your DaylyFlow app.';
    case OnboardingPagePosition.page2:
      return 'In Uptodo you can create your personalized routine to stay productive';
    case OnboardingPagePosition.page3:
      return 'You can organize your daily tasks by adding your tasks into separate categories';
  }
}
