import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  // bool get isLightMode => Theme.of(this).brightness == Brightness.light;
}
