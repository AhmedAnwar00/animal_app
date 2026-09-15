import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool get hasMinLength => password.length >= 12;

  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));

  bool get hasLowercase => password.contains(RegExp(r'[a-z]'));

  bool get hasSpecial => password.contains(RegExp(r'[^A-Za-z0-9]'));

  bool get hasNumber => password.contains(RegExp(r'[0-9]'));

  void updateFirstName(String value) {
    firstName = value;
  }

  void updateLastName(String value) {
    lastName = value;
  }

  void updateEmail(String value) {
    email = value;
  }

  void updatePhone(String value) {
    phone = value;
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
  }

  void toggleObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void onSignUpPressed() {}

  void onSelectImagePressed() {}

  void onLogInPressed() {
    if (AppRouter.canPop) {
      AppRouter.pop();
    } else {
      AppRouter.pushReplacementNamed(AppRoutes.login);
    }
  }
}
