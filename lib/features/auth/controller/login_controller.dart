import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  String email = '';
  String password = '';
  bool obscurePassword = true;

  void updateEmail(String value) {
    email = value;
  }

  void updatePassword(String value) {
    password = value;
  }

  void toggleObscure() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void onLogInPressed() {}

  void onForgetPasswordPressed() {}

  void onSignUpPressed() {
    AppRouter.pushNamed(AppRoutes.signUp);
  }
}
