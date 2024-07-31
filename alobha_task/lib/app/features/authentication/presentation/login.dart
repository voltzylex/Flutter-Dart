import 'package:flutter/material.dart';
import 'package:ios_native_method/app/common/widget/background_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
        appBar: AppBar(
            // backgroundColor: AppColors.primary,
            ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi! Welcome!",
            ),
          ],
        ));
  }
}
