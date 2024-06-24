import 'package:flutter/material.dart';
import 'package:pizza_corner/feature/home/presentation/widgets/search_box.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SearchBox(),
        ],
      ),
    );
  }
}
