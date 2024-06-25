import 'package:flutter/material.dart';
import 'package:pizza_corner/feature/home/presentation/widgets/catergories.dart';
import 'package:pizza_corner/feature/home/presentation/widgets/items_card.dart';
import 'package:pizza_corner/feature/home/presentation/widgets/search_box.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SearchBox(),
          Catergories(),
          ItemsCard(),
        ],
      ),
    );
  }
}
