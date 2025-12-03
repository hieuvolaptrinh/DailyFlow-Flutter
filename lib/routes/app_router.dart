import 'package:flutter/material.dart';
import 'package:dailyflow/routes/routes.dart';
import 'package:dailyflow/ui/splash/splash.dart' show SplashScreen;
import 'package:dailyflow/ui/onboarding/onboarding_page_view.dart';
import 'package:dailyflow/ui/welcome/welcome_page.dart';
import 'package:dailyflow/ui/login/login_page.dart';
import 'package:dailyflow/ui/register/register_page.dart';
import 'package:dailyflow/ui/main/main_page.dart';
import 'package:dailyflow/ui/task/create_task_page.dart';
import 'package:dailyflow/ui/category/category_list_dialog.dart';
import 'package:dailyflow/ui/category/create_edit_category_page.dart';
import 'package:dailyflow/ui/task_priority/task_priority_list_dialog.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPageView(),
          settings: settings,
        );

      case Routes.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomePage(),
          settings: settings,
        );

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
          settings: settings,
        );

      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
          settings: settings,
        );

      case Routes.createTask:
        return MaterialPageRoute(
          builder: (_) => const CreateTaskPage(),
          settings: settings,
        );

      case Routes.categoryList:
        return MaterialPageRoute(
          builder: (_) => const CategoryListDialog(),
          settings: settings,
        );

      case Routes.createEditCategory:
        // Truyền argument nếu cần (edit mode)
        final args = settings.arguments as Map<String, dynamic>?;
        final categoryId = args?['categoryId'] as String?;
        return MaterialPageRoute(
          builder: (_) => CreateOrEditCategoryPage(categoryId: categoryId),
          settings: settings,
        );

      case Routes.taskPriorityList:
        return MaterialPageRoute(
          builder: (_) => const TaskPriorityListDialog(),
          settings: settings,
        );

      default:
        // Trang 404
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
