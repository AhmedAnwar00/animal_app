import 'package:animal_app/features/auth/controller/sign_up_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/login_brand_header.dart';
import 'package:animal_app/features/auth/ui/widgets/login_password_eye_button.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_labeled_field.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_login_prompt.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_field.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_hint.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_password_rules.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_primary_button.dart';
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
    _controller = SignUpController();
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
                          label: 'First Name',
                          hintText: 'Enter your First Name',
                          onChanged: _controller.updateFirstName,
                        ),
                      ),
                      Positioned(
                        top: 282,
                        left: 18,
                        child: SignUpLabeledField(
                          label: 'Last Name',
                          hintText: 'Enter your Last Name',
                          onChanged: _controller.updateLastName,
                        ),
                      ),
                      Positioned(
                        top: 372,
                        left: 18,
                        child: SignUpLabeledField(
                          label: 'Email',
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _controller.updateEmail,
                        ),
                      ),
                      Positioned(
                        top: 462,
                        left: 18,
                        child: SignUpLabeledField(
                          label: 'Phone',
                          hintText: 'Enter your Phone',
                          keyboardType: TextInputType.phone,
                          onChanged: _controller.updatePhone,
                        ),
                      ),
                      Positioned(
                        top: 552,
                        left: 18,
                        child: SignUpPasswordField(
                          label: 'Password',
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
                          label: 'Confirm Password',
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
                          onSelectFilePressed: _controller.onSelectImagePressed,
                        ),
                      ),
                      Positioned(
                        top: 1105,
                        left: 16.5,
                        child: SignUpPrimaryButton(
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
