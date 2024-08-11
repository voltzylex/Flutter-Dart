import 'package:flutter/material.dart';
import 'package:plant_shop_ui/app/common/extensions/common_extension.dart';

class WelcomeWid extends StatelessWidget {
  const WelcomeWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Welcome To",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        10.w,
        const Icon(Icons.shopping_cart)
      ],
    );
  }
}
