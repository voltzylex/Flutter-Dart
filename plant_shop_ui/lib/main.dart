import 'package:flutter/material.dart';
import 'package:plant_shop_ui/app/features/bottom_bar/pages/bottom_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavBarPage(),
    );
  }
}
