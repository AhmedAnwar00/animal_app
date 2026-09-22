import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/otp_verification_args.dart';
import 'package:animal_app/features/auth/ui/create_new_password_page.dart';
import 'package:animal_app/features/auth/ui/forget_password_page.dart';
import 'package:animal_app/features/auth/ui/login_page.dart';
import 'package:animal_app/features/auth/ui/otp_verification_page.dart';
import 'package:animal_app/features/auth/ui/sign_up_page.dart';
import 'package:animal_app/features/shell/ui/app_shell.dart';
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

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String route, {
    bool Function(Route<dynamic>)? predicate,
    Object? arguments,
  }) {
    return navigator.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (_) => false,
      arguments: arguments,
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
        final args = settings.arguments;
        final OtpFlow flow;
        final String email;
        if (args is OtpVerificationArgs) {
          flow = args.flow;
          email = args.email;
        } else if (args is OtpFlow) {
          flow = args;
          email = '';
        } else {
          flow = OtpFlow.forgotPassword;
          email = '';
        }
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => OtpVerificationPage(flow: flow, email: email),
        );
      case AppRoutes.createNewPassword:
        final email =
            settings.arguments is String ? settings.arguments as String : '';
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CreateNewPasswordPage(email: email),
        );
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AppShell(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
    }
  }
}
