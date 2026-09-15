import 'package:animal_app/features/auth/controller/login_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/login_brand_header.dart';
import 'package:animal_app/features/auth/ui/widgets/login_email_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_forget_password_link.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_eye_button.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_primary_button.dart';
import 'package:animal_app/features/auth/ui/widgets/login_sign_up_prompt.dart';
import 'package:animal_app/features/auth/ui/widgets/login_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.controller});

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, _) {
            return Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 375,
                height: 762,
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
                      left: 134,
                      child: LoginTitle(),
                    ),
                    Positioned(
                      top: 192,
                      left: 18,
                      child: LoginEmailField(
                        onChanged: controller.updateEmail,
                      ),
                    ),
                    Positioned(
                      top: 282,
                      left: 18,
                      child: LoginPasswordField(
                        obscureText: controller.obscurePassword,
                        onChanged: controller.updatePassword,
                      ),
                    ),
                    Positioned(
                      top: 326,
                      left: 324,
                      child: LoginPasswordEyeButton(
                        onPressed: controller.toggleObscure,
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 241,
                      child: LoginForgetPasswordLink(
                        onPressed: controller.onForgetPasswordPressed,
                      ),
                    ),
                    Positioned(
                      top: 417,
                      left: 18,
                      child: LoginPrimaryButton(
                        onPressed: controller.onLogInPressed,
                      ),
                    ),
                    Positioned(
                      top: 718,
                      left: 44,
                      child: LoginSignUpPrompt(
                        onSignUpPressed: controller.onSignUpPressed,
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
