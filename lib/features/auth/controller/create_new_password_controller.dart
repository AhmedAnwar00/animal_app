import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/create_new_password_request.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/foundation.dart';

class CreateNewPasswordController extends ChangeNotifier {
  CreateNewPasswordController(this._authService, {required this.email});

  final AuthService _authService;
  final String email;

  String password = '';
  String confirmPassword = '';
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;
  String? errorMessage;

  bool get hasMinLength => password.length >= 12;

  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));

  bool get hasLowercase => password.contains(RegExp(r'[a-z]'));

  bool get hasSpecial => password.contains(RegExp(r'[^A-Za-z0-9]'));

  bool get hasNumber => password.contains(RegExp(r'[0-9]'));

  bool get _passwordRulesValid =>
      hasMinLength &&
      hasUppercase &&
      hasLowercase &&
      hasSpecial &&
      hasNumber;

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

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  void onCancelPressed() {
    AppRouter.pop();
  }

  Future<void> onSubmitPressed() async {
    if (isLoading) return;

    final validationError = _validate();
    if (validationError != null) {
      errorMessage = validationError;
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.createNewPassword(
        CreateNewPasswordRequest(
          email: email.trim(),
          password: password,
          confirmPassword: confirmPassword,
        ),
      );

      if (response.statusCode == 200) {
        AppRouter.pushNamedAndRemoveUntil(AppRoutes.login);
      } else {
        errorMessage = response.message;
      }
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String? _validate() {
    if (password.isEmpty) return 'Password is required';
    if (!_passwordRulesValid) {
      return 'Password does not meet the required rules';
    }
    if (password != confirmPassword) return 'Passwords do not match';
    return null;
  }
}
