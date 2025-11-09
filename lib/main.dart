import 'package:dailyflow/ui/category/create_edit_category_page.dart';
import 'package:dailyflow/ui/main/main_page.dart';
import 'package:dailyflow/ui/onboarding/onboarding_page_view.dart';
import 'package:dailyflow/ui/page/welcome_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dailyflow/ui/splash/splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale("vi"), // viêtnamese
        Locale("en"), // english
      ],
      path: "assets/translations",
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 88, 93, 240),
        ),
        // fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      // home: SafeArea(child: WelcomePage(isFirstTimeInstallApp: true)),
      // home: SafeArea(child: MainPage()),
      home: SafeArea(child: CreateOrEditCategoryPage()),
      // language
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
    );
  }
}
