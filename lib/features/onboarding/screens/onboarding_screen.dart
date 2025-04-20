import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/features/onboarding/models/onboarding_item.dart';
import 'package:get/get.dart';
import 'package:flutter_multi_vendor_store/features/onboarding/controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: controller.pageController,
              itemCount: controller.items.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return _buildPage(
                  context,
                  controller.items[index],
                );
              }),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, OnboardingItem item) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.image,
            height: 300,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
