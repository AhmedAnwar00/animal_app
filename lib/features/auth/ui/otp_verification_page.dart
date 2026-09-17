import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/features/auth/controller/otp_verification_controller.dart';
import 'package:animal_app/features/auth/model/otp_flow.dart';
import 'package:animal_app/features/auth/service/auth_service.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_cancel_button.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_code_fields.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_confirm_button.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_resend_text.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_subtitle.dart';
import 'package:animal_app/features/auth/ui/widgets/otp_verification_title.dart';
import 'package:flutter/material.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    super.key,
    this.flow = OtpFlow.forgotPassword,
    this.email = '',
  });

  final OtpFlow flow;
  final String email;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late final OtpVerificationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OtpVerificationController(
      AuthService(DioClient()),
      flow: widget.flow,
      email: widget.email,
    );
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
                      child: OtpVerificationTitle(),
                    ),
                    const Positioned(
                      top: 71,
                      left: 22,
                      child: OtpVerificationSubtitle(),
                    ),
                    Positioned(
                      top: 159,
                      left: 17,
                      child: OtpVerificationCodeFields(
                        controller: _controller,
                      ),
                    ),
                    Positioned(
                      top: 253,
                      left: 18,
                      child: OtpVerificationConfirmButton(
                        onPressed: _controller.onConfirmPressed,
                      ),
                    ),
                    Positioned(
                      top: 303,
                      left: 0,
                      right: 0,
                      child: OtpVerificationResendText(
                        canResend: _controller.canResend,
                        formattedTime: _controller.formattedTime,
                        onResendPressed: _controller.onResendPressed,
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
