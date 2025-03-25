import 'package:flutter_multi_vendor_store/features/auth/views/screens/sign_in_screen.dart';
import 'package:flutter_multi_vendor_store/features/onboarding/screens/onboarding_screen.dart';
import 'package:flutter_multi_vendor_store/features/splash/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const signIn = '/signin';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
  ];
}
