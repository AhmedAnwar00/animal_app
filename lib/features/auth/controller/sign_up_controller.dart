import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/signup_request.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends ChangeNotifier {
  SignUpController(this._authService);

  final AuthService _authService;
  final ImagePicker _imagePicker = ImagePicker();

  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String? imagePath;
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

  void clearError() {
    if (errorMessage == null) return;
    errorMessage = null;
  }

  Future<void> onSelectImagePressed() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    imagePath = file.path;
    notifyListeners();
  }

  Future<void> onSignUpPressed() async {
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
      final response = await _authService.signup(
        SignupRequest(
          firstName: firstName.trim(),
          lastName: lastName.trim(),
          email: email.trim(),
          phone: phone.trim(),
          password: password,
          imagePath: imagePath!,
        ),
      );

      if (response.statusCode == 201) {
        AppRouter.pushNamed(
          AppRoutes.otpVerification,
          arguments: OtpFlow.signup,
        );
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
    if (firstName.trim().isEmpty) return 'First name is required';
    if (lastName.trim().isEmpty) return 'Last name is required';
    if (email.trim().isEmpty) return 'Email is required';
    if (phone.trim().isEmpty) return 'Phone is required';
    if (password.isEmpty) return 'Password is required';
    if (!_passwordRulesValid) {
      return 'Password does not meet the required rules';
    }
    if (password != confirmPassword) return 'Passwords do not match';
    if (imagePath == null || imagePath!.isEmpty) {
      return 'Profile image is required';
    }
    return null;
  }

  void onLogInPressed() {
    if (AppRouter.canPop) {
      AppRouter.pop();
    } else {
      AppRouter.pushReplacementNamed(AppRoutes.login);
    }
  }
}
