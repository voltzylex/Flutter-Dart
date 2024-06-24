import 'package:flutter/material.dart';
import 'package:pizza_corner/core/const.dart';
import 'package:pizza_corner/feature/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Pizza",
      theme: ThemeData(primaryColor: primaryColor,visualDensity: VisualDensity.adaptivePlatformDensity ),
      home: HomePage(),
    );
  }
}
