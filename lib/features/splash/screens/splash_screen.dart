import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/config/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF09122C) : Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => _buildAnimatedContent(isDark),
        ),
      ),
    );
  }

  Widget _buildAnimatedContent(bool isDark) {
    return Transform.translate(
      offset: Offset(0, _slideAnimation.value),
      child: Transform.rotate(
        angle: _rotateAnimation.value,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildSplashContent(isDark),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashContent(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildLogoContainer()],
    );
  }

  Widget _buildLogoContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        Icons.shopping_bag_outlined,
        size: 48,
        color: Colors.white.withOpacity(0.95),
      ),
    );
  }
}
