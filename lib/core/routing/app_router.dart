import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/ui/forget_password_page.dart';
import 'package:animal_app/features/auth/ui/login_page.dart';
import 'package:animal_app/features/auth/ui/otp_verification_page.dart';
import 'package:animal_app/features/auth/ui/sign_up_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => navigatorKey.currentState!;

  static Future<T?> pushNamed<T extends Object?>(
    String route, {
    Object? arguments,
  }) {
    return navigator.pushNamed<T>(route, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String route, {
    Object? arguments,
    TO? result,
  }) {
    return navigator.pushReplacementNamed<T, TO>(
      route,
      arguments: arguments,
      result: result,
    );
  }

  static void pop<T extends Object?>([T? result]) {
    navigator.pop<T>(result);
  }

  static bool get canPop => navigator.canPop();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.signUp:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SignUpPage(),
        );
      case AppRoutes.forgetPassword:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ForgetPasswordPage(),
        );
      case AppRoutes.otpVerification:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const OtpVerificationPage(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
    }
  }
}
