import 'package:flutter/material.dart';
import 'package:flutter_deeplinking/config/widget/common_text.dart';

class SecondPage2 extends StatelessWidget {
  const SecondPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: "Second Page"),
      ),
      body: const Center(
        child: CommonText(text: "2"),
      ),
    );
  }
}
