import 'package:flutter/material.dart';
import 'package:flutter_deeplinking/config/widget/common_text.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: "First Page"),
      ),
      body: const Center(
        child: CommonText(text: "1"),
      ),
    );
  }
}
