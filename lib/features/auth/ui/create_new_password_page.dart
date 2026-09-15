import 'package:animal_app/features/auth/controller/create_new_password_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/create_new_password_submit_button.dart';
import 'package:animal_app/features/auth/ui/widgets/create_new_password_title.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_eye_button.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_cancel_button.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_hint.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_rules.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  late final CreateNewPasswordController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CreateNewPasswordController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 375,
                height: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 18,
                      child: OtpVerificationCancelButton(
                        onPressed: _controller.onCancelPressed,
                      ),
                    ),
                    const Positioned(
                      top: 41,
                      left: 18,
                      child: CreateNewPasswordTitle(),
                    ),
                    Positioned(
                      top: 75,
                      left: 18,
                      child: SignUpPasswordField(
                        label: 'New Password',
                        obscureText: _controller.obscurePassword,
                        onChanged: _controller.updatePassword,
                      ),
                    ),
                    Positioned(
                      top: 119,
                      left: 324,
                      child: LoginPasswordEyeButton(
                        onPressed: _controller.toggleObscurePassword,
                      ),
                    ),
                    const Positioned(
                      top: 158,
                      left: 18,
                      child: SignUpPasswordHint(),
                    ),
                    Positioned(
                      top: 184,
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
                      top: 291,
                      left: 18,
                      child: SignUpPasswordField(
                        label: 'Confirm Password',
                        obscureText: _controller.obscureConfirmPassword,
                        onChanged: _controller.updateConfirmPassword,
                      ),
                    ),
                    Positioned(
                      top: 335,
                      left: 324,
                      child: LoginPasswordEyeButton(
                        onPressed: _controller.toggleObscureConfirmPassword,
                      ),
                    ),
                    Positioned(
                      top: 447,
                      left: 18,
                      child: CreateNewPasswordSubmitButton(
                        onPressed: _controller.onSubmitPressed,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
