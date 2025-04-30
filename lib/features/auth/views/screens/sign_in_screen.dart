import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/config/theme/app_colors.dart';
import 'package:flutter_multi_vendor_store/features/auth/views/screens/forgot_password_screen.dart';
import 'package:flutter_multi_vendor_store/features/auth/views/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  String? emailError;
  String? passwordError;

  void validateInputs() {}

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: isDark ? Colors.white : AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: isDark ? Colors.white70 : AppColors.textLight,
                    ),
              ),
              const SizedBox(height: 40),

              // email text field
              CustomTextField(
                label: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                errorText: emailError,
                onFieldSubmitted: (_) {
                  validateInputs();
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(height: 16),

              // password textfield
              CustomTextField(
                label: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icons.lock_outline,
                controller: passwordController,
                isPassword: true,
                errorText: passwordError,
                onFieldSubmitted: (_) {
                  validateInputs();
                  FocusScope.of(context).unfocus();
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: isDark ? Colors.white70 : AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
