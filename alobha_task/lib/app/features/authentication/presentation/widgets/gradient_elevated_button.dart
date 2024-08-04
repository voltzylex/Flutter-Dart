import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';

class GradientElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
      
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        elevation: WidgetStateProperty.all(5),
        padding: WidgetStateProperty.all(
            EdgeInsets.zero), // Remove padding to fit gradient
        backgroundColor: WidgetStateProperty.all(
            Colors.transparent), // Make button background transparent
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
        overlayColor: WidgetStateProperty.all(
            Colors.transparent), // Make overlay color transparent
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.secondary, AppColors.primaryDark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: 55,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
