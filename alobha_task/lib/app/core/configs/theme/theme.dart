import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      // scaffoldBackgroundColor: AppColors.transparent,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.primary),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: AppColors.primary),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ));
}
