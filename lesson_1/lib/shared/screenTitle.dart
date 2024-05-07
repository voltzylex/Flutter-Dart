import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String? text;

  const ScreenTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeIn,
        child: Text(
          text ?? "",
          style: TextStyle(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        builder: (context, val, child) {
          return Opacity(
              opacity: val,
              child: Padding(
                padding: EdgeInsets.only(top: val * 50),
                child: child!,
              ));
        });
  }
}
