import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/forgot_password_otp_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widget/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                'Set Password',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'Minimum Number Of Password Should Be 8 Character',
                style: textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              _buildResetPasswordForm(),
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

  Widget _buildResetPasswordForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Confirm Password',
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
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
        (route) => false);
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
