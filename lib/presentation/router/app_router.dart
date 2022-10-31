import 'package:flutter/material.dart';
import '../screens/shared/home_screen.dart';
import '../screens/shared/login_screen.dart';
import '../screens/shared/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/shared/verify_screen.dart';

class AppRouter {

  /// Function To Navigate to the Specified route
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'SplashScreen':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case 'LoginScreen':
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(seconds: 2),
            reverseDuration: const Duration(seconds: 2));
      case 'VerifyScreen':
        return MaterialPageRoute(builder: (_) => VerifyScreen());
      case 'HomePage':
        return PageTransition(
            child: const HomePage(),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(seconds: 2),
            reverseDuration: const Duration(seconds: 2));
      default:
        return null;
    }
  }
}