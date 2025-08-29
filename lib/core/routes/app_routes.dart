import 'package:flutter/material.dart';
import 'package:news/core/routes/page_route_name.dart';
import 'package:news/modules/home/home_view.dart';
import 'package:news/modules/splash/splash_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => SplashView(),
          settings: settings,
        );
      case PageRoutesName.home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
