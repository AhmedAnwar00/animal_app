import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/core/storage/token_storage.dart';
import 'package:animal_app/features/auth/controller/login_controller.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:animal_app/features/auth/ui/widgets/login_brand_header.dart';
import 'package:animal_app/features/auth/ui/widgets/login_email_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_forget_password_link.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_eye_button.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/login_primary_button.dart';
import 'package:animal_app/features/auth/ui/widgets/login_sign_up_prompt.dart';
import 'package:animal_app/features/auth/ui/widgets/login_title.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(AuthService(DioClient()), TokenStorage());
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      _controller.clearError();
    });
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
              child: SizedBox(
                width: 375,
                height: double.infinity,
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
                        onChanged: _controller.updateEmail,
                      ),
                    ),
                    Positioned(
                      top: 282,
                      left: 18,
                      child: LoginPasswordField(
                        obscureText: _controller.obscurePassword,
                        onChanged: _controller.updatePassword,
                      ),
                    ),
                    Positioned(
                      top: 326,
                      left: 324,
                      child: LoginPasswordEyeButton(
                        onPressed: _controller.toggleObscure,
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 241,
                      child: LoginForgetPasswordLink(
                        onPressed: _controller.onForgetPasswordPressed,
                      ),
                    ),
                    Positioned(
                      top: 417,
                      left: 18,
                      child: LoginPrimaryButton(
                        isLoading: _controller.isLoading,
                        onPressed: _controller.onLogInPressed,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: LoginSignUpPrompt(
                          onSignUpPressed: _controller.onSignUpPressed,
                        ),
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
