import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/reset_passward_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widget/screen_background.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBackground(
            child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 128,
              ),
              Text(
                'Pin Verification',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'A 6 Digit Pin Has Been Sent To Your Email Address For Verification, Please Enter The Pin',
                style: textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              _buildVerifyEmailForm(),
              const SizedBox(
                height: 48,
              ),
              Center(
                child: _buildHaveAccountSection(),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildVerifyEmailForm() {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: const Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  void _onTapNextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
      ),
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        text: "Have an account?   ",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          letterSpacing: 0.5,
        ),
        children: [
          TextSpan(
            text: 'Sign IN',
            recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
            style: const TextStyle(
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
        (route) => false);
  }
}
