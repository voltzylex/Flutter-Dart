import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Root page"),
      ),
    );
  }
}
