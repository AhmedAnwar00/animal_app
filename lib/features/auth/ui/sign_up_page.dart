import 'package:animal_app/core/l10n/l10n_extension.dart';
import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/auth/controller/sign_up_controller.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:animal_app/features/auth/ui/widgets/login_brand_header.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_eye_button.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_labeled_field.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_login_prompt.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_hint.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_rules.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_primary_button.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_image_source_sheet.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_profile_image_upload.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SignUpController(AuthService(DioClient()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleErrorMessage() {
    final message = _controller.errorMessage;
    if (message == null || !mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      _controller.clearError();
    });
  }

  Future<void> _onSelectFilePressed() async {
    final source = await SignUpImageSourceSheet.show(context);
    if (!mounted) return;
    switch (source) {
      case SignUpImageSource.gallery:
        await _controller.pickFromGallery();
      case SignUpImageSource.camera:
        await _controller.pickFromCamera();
      case SignUpImageSource.cancel:
      case null:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            _handleErrorMessage();
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 375,
                  height: 1210,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: 0,
                        left: 152,
                        child: LoginBrandHeader(),
                      ),
                      const Positioned(
                        top: 102,
                        left: 0,
                        right: 0,
                        child: Center(child: SignUpTitle()),
                      ),
                      Positioned(
                        top: 192,
                        left: 18,
                        child: SignUpLabeledField(
                          label: context.l10n.firstName,
                          hintText: context.l10n.enterFirstName,
                          onChanged: _controller.updateFirstName,
                        ),
                      ),
                      Positioned(
                        top: 282,
                        left: 18,
                        child: SignUpLabeledField(
                          label: context.l10n.lastName,
                          hintText: context.l10n.enterLastName,
                          onChanged: _controller.updateLastName,
                        ),
                      ),
                      Positioned(
                        top: 372,
                        left: 18,
                        child: SignUpLabeledField(
                          label: context.l10n.email,
                          hintText: context.l10n.enterEmail,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _controller.updateEmail,
                        ),
                      ),
                      Positioned(
                        top: 462,
                        left: 18,
                        child: SignUpLabeledField(
                          label: context.l10n.phone,
                          hintText: context.l10n.enterPhone,
                          keyboardType: TextInputType.phone,
                          onChanged: _controller.updatePhone,
                        ),
                      ),
                      Positioned(
                        top: 552,
                        left: 18,
                        child: SignUpPasswordField(
                          label: context.l10n.password,
                          obscureText: _controller.obscurePassword,
                          onChanged: _controller.updatePassword,
                        ),
                      ),
                      Positioned(
                        top: 596,
                        left: 324,
                        child: LoginPasswordEyeButton(
                          onPressed: _controller.toggleObscurePassword,
                        ),
                      ),
                      const Positioned(
                        top: 634,
                        left: 18,
                        child: SignUpPasswordHint(),
                      ),
                      Positioned(
                        top: 660,
                        left: 18,
                        child: SignUpPasswordRules(
                          hasMinLength: _controller.hasMinLength,
                          hasUppercase: _controller.hasUppercase,
                          hasLowercase: _controller.hasLowercase,
                          hasSpecial: _controller.hasSpecial,
                          hasNumber: _controller.hasNumber,
                        ),
                      ),
                      Positioned(
                        top: 766,
                        left: 18,
                        child: SignUpPasswordField(
                          label: context.l10n.confirmPassword,
                          obscureText: _controller.obscureConfirmPassword,
                          onChanged: _controller.updateConfirmPassword,
                        ),
                      ),
                      Positioned(
                        top: 810,
                        left: 324,
                        child: LoginPasswordEyeButton(
                          onPressed: _controller.toggleObscureConfirmPassword,
                        ),
                      ),
                      Positioned(
                        top: 859,
                        left: 18,
                        child: SignUpProfileImageUpload(
                          imagePath: _controller.imagePath,
                          onSelectFilePressed: _onSelectFilePressed,
                        ),
                      ),
                      Positioned(
                        top: 1105,
                        left: 16.5,
                        child: SignUpPrimaryButton(
                          isLoading: _controller.isLoading,
                          onPressed: _controller.onSignUpPressed,
                        ),
                      ),
                      Positioned(
                        top: 1161,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SignUpLoginPrompt(
                            onLogInPressed: _controller.onLogInPressed,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
