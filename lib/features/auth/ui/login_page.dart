import 'package:animal_app/features/auth/controller/login_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/login_brand_header.dart';
import 'package:animal_app/features/auth/ui/widgets/login_email_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_primary_button.dart';
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
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      const LoginBrandHeader(),
                      const SizedBox(height: 24),
                      const LoginTitle(),
                      const SizedBox(height: 24),
                      LoginEmailField(
                        onChanged: controller.updateEmail,
                      ),
                      const SizedBox(height: 20),
                      LoginPasswordField(
                        obscureText: controller.obscurePassword,
                        onChanged: controller.updatePassword,
                        onToggleObscure: controller.toggleObscure,
                      ),
                      const SizedBox(height: 40),
                      LoginPrimaryButton(
                        onPressed: controller.onLogInPressed,
                      ),
                      const SizedBox(height: 24),
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
