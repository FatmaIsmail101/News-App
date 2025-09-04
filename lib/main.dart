import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/extension/provider/theme_provider.dart';
import 'package:news/core/routes/app_routes.dart';
import 'package:news/core/routes/page_route_name.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(supportedLocales: [
    Locale('en'), Locale('ar'),

  ],
      fallbackLocale: Locale("en"),
      path: 'assets/translations',
      child: ChangeNotifierProvider(create: (context) => ThemeProvider(),
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return MaterialApp(
              theme: AppThemeManager.lightTheme,
              darkTheme: AppThemeManager.darkTheme,
              themeMode: provider.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'News',
              initialRoute: PageRoutesName.initial,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            );
          },
        );
      },

    );
  }
}

