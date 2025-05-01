import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/common/utils/validation_utils.dart';
import 'package:flutter_multi_vendor_store/core/common/widgets/custom_button.dart';
import 'package:flutter_multi_vendor_store/core/config/theme/app_colors.dart';
import 'package:flutter_multi_vendor_store/features/auth/views/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  String? emailError;

  void validateInputs() {
    setState(() {
      emailError = ValidationUtils.validateEmail(emailController.text);
    });
  }

  bool get isValid => emailError == null;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : AppColors.textDark,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: isDark ? Colors.white : AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter your email address to reset your password',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDark ? Colors.white : AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              errorText: emailError,
              onChanged: (value) => validateInputs(),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                validateInputs();
                // password reset
              },
              isDisabled: !isValid,
            )
          ],
        ),
      ),
    );
  }
}
