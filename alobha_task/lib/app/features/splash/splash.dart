import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';
import 'package:ios_native_method/app/features/authentication/presentation/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          )),
    );
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.assistant_rounded,
          color: AppColors.primary,
          size: 100,
        ),
      ),
    );
  }
}
