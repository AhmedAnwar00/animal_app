import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/core/storage/token_storage.dart';
import 'package:animal_app/features/auth/model/login_request.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/foundation.dart';

class LoginController extends ChangeNotifier {
  LoginController(this._authService, this._tokenStorage);

  final AuthService _authService;
  final TokenStorage _tokenStorage;

  String email = '';
  String password = '';
  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

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

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  Future<void> onLogInPressed() async {
    debugPrint('[LOGIN DEBUG] 2 LoginController.onLogInPressed start');
    debugPrint('[LOGIN DEBUG] 2 email="$email" passwordLen=${password.length} isLoading=$isLoading');
    if (isLoading) {
      debugPrint('[LOGIN DEBUG] 2 STOP: already loading');
      return;
    }

    final validationError = _validate();
    if (validationError != null) {
      debugPrint('[LOGIN DEBUG] 2 STOP: validation → $validationError');
      errorMessage = validationError;
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      debugPrint('[LOGIN DEBUG] 2 calling AuthService.login()');
      final response = await _authService.login(
        LoginRequest(
          email: email.trim(),
          password: password,
        ),
      );
      debugPrint(
        '[LOGIN DEBUG] 2 AuthService.login returned statusCode=${response.statusCode} message=${response.message}',
      );

      if (response.statusCode == 200) {
        await _tokenStorage.saveTokens(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );
        AppRouter.pushNamedAndRemoveUntil(AppRoutes.home);
      } else {
        debugPrint(
          '[LOGIN DEBUG] 2 errorMessage ← response.message: "${response.message}"',
        );
        errorMessage = response.message;
      }
    } catch (e) {
      final mapped = e.toString().replaceFirst('Exception: ', '');
      debugPrint('[LOGIN DEBUG] 2 errorMessage ← catch: "$mapped"');
      errorMessage = mapped;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String? _validate() {
    final trimmedEmail = email.trim();
    if (trimmedEmail.isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(trimmedEmail)) {
      return 'Please enter a valid email';
    }
    if (password.isEmpty) return 'Password is required';
    return null;
  }

  void onForgetPasswordPressed() {
    AppRouter.pushNamed(AppRoutes.forgetPassword);
  }

  void onSignUpPressed() {
    AppRouter.pushNamed(AppRoutes.signUp);
  }
}
