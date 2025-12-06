import 'package:dailyflow/routes/routes.dart';
import 'package:dailyflow/routes/app_router.dart';
import 'package:dailyflow/ui/category/create_edit_category_page.dart';
import 'package:dailyflow/ui/main/main_page.dart';
import 'package:dailyflow/viewmodel/category_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
      child: MaterialApp(
        title: 'DailyFlow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 88, 93, 240),
          ),
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        initialRoute: Routes.main,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
