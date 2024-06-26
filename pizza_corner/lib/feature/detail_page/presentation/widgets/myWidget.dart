import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String price;

  const MyWidget({super.key, required this.price});
  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
