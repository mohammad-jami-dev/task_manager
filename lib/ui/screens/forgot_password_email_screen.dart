import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_otp_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widget/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
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
                'Your Email Account',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'A 6 Digit Pin Will Be Sent To Your Email Address For Verification',
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
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
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
        builder: (context) => const ForgotPasswordOtpScreen(),
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
    Navigator.pop(context);
  }
}
