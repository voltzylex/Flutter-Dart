import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/theme.dart';
import 'package:ios_native_method/app/features/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
