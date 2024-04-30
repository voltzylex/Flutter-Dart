import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String? text;

  const ScreenTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: 1),
        child: Text(
          text ?? "",
          style: TextStyle(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        builder: (context, val, child) {
          return Opacity(opacity: val, child: child!);
        });
  }
}
