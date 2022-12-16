import 'dart:developer';

import 'package:flutter/material.dart';

import '../../modules/home/home_page.dart';
import '../../modules/main/main_page.dart';
import '../widgets/custom_text.dart';

class AppRouter {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    try {
      late final Widget page;
      log("AppRouter.generateRoute: ${settings.name}");
      switch (settings.name) {
        case '/':
          page = const MainPage();
          break;
        case HomePage.routeName:
          page = const HomePage();
          break;

        default:
          page = const Scaffold(
            body: Center(
              child: MyText('Page not found'),
            ),
          );
      }
      return MaterialPageRoute(
        builder: (_) => page,
      );
    } catch (e) {
      log("AppRouter.generateRoute: $e");
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: MyText('Page not found'),
          ),
        ),
      );
    }
  }
}
