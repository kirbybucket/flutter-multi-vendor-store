import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/common/utils/text_scale_wrapper.dart';
import 'package:flutter_multi_vendor_store/core/config/theme/app_theme.dart';
import 'package:flutter_multi_vendor_store/core/controllers/theme_controller.dart';
import 'package:flutter_multi_vendor_store/core/routes/app_routes.dart';
import 'package:flutter_multi_vendor_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_multi_vendor_store/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async => ThemeController());
  Get.put(SplashController());
  Get.put(OnboardingController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextScaleWrapper(
      child: GetMaterialApp(
        title: 'Multi-Vendor E-Commerce App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeController.to.themeMode,
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
