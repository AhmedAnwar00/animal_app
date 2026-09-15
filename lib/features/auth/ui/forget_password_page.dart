import 'package:animal_app/features/auth/controller/forget_password_controller.dart';
import 'package:animal_app/features/auth/ui/widgets/forget_password_back_button.dart';
import 'package:animal_app/features/auth/ui/widgets/forget_password_send_code_button.dart';
import 'package:animal_app/features/auth/ui/widgets/forget_password_subtitle.dart';
import 'package:animal_app/features/auth/ui/widgets/forget_password_title.dart';
import 'package:animal_app/features/auth/ui/widgets/sign_up_labeled_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late final ForgetPasswordController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ForgetPasswordController();
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
                      child: ForgetPasswordBackButton(
                        onPressed: _controller.onBackPressed,
                      ),
                    ),
                    const Positioned(
                      top: 41,
                      left: 18,
                      child: ForgetPasswordTitle(),
                    ),
                    const Positioned(
                      top: 71,
                      left: 22,
                      child: ForgetPasswordSubtitle(),
                    ),
                    Positioned(
                      top: 192,
                      left: 18,
                      child: SignUpLabeledField(
                        label: 'Email',
                        hintText: 'Enter your email address',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: _controller.updateEmail,
                      ),
                    ),
                    Positioned(
                      top: 417,
                      left: 18,
                      child: ForgetPasswordSendCodeButton(
                        onPressed: _controller.onSendCodePressed,
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
