import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor_store/core/common/utils/text_scale_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextScaleWrapper(
      child: MaterialApp(
        title: 'Multi-Vendor E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
