import 'package:animal_app/core/routing/app_router.dart';
import 'package:animal_app/generated/l10n.dart';
import 'package:animal_app/core/routing/app_routes.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/model/otp_verification_args.dart';
import 'package:animal_app/features/auth/model/signup_request.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
      hasMinLength && hasUppercase && hasLowercase && hasSpecial && hasNumber;

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

  Future<void> pickFromGallery() async {
    await _pickImage(
      source: ImageSource.gallery,
      permission: Permission.photos,
      deniedMessage: S.current.photoLibraryPermissionRequired,
    );
  }

  Future<void> pickFromCamera() async {
    await _pickImage(
      source: ImageSource.camera,
      permission: Permission.camera,
      deniedMessage: S.current.cameraPermissionRequired,
    );
  }

  Future<void> _pickImage({
    required ImageSource source,
    required Permission permission,
    required String deniedMessage,
  }) async {
    final status = await permission.request();
    if (!status.isGranted && !status.isLimited) {
      errorMessage = deniedMessage;
      notifyListeners();
      return;
    }

    try {
      final file = await _imagePicker.pickImage(source: source);
      if (file == null) return;
      imagePath = file.path;
      notifyListeners();
    } catch (_) {
      errorMessage = S.current.failedToPickImage;
      notifyListeners();
    }
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
          arguments: OtpVerificationArgs(
            flow: OtpFlow.signup,
            email: email.trim(),
          ),
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
    if (firstName.trim().isEmpty) return S.current.firstNameRequired;
    if (lastName.trim().isEmpty) return S.current.lastNameRequired;
    if (email.trim().isEmpty) return S.current.emailRequired;
    if (phone.trim().isEmpty) return S.current.phoneRequired;
    if (password.isEmpty) return S.current.passwordRequired;
    if (!_passwordRulesValid) {
      return S.current.passwordRules;
    }
    if (password != confirmPassword) return S.current.passwordsDoNotMatch;
    if (imagePath == null || imagePath!.isEmpty) {
      return S.current.profileImageRequired;
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
