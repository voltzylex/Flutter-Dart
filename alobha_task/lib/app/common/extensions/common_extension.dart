import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme get tTheme {
    return Theme.of(this).textTheme;
  }

  TextStyle get bLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get bMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bSmall => Theme.of(this).textTheme.bodySmall!;
}

extension SizeBoxExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension PaddingExtension on Widget {
  Padding padding({EdgeInsets padding = EdgeInsets.zero}) => Padding(
        padding: padding,
        child: this,
      );
}
