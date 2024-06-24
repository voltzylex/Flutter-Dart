import 'package:flutter/material.dart';

class Catergories extends StatefulWidget {
  const Catergories({super.key});

  @override
  State<Catergories> createState() => _CatergoriesState();
}

class _CatergoriesState extends State<Catergories> {
  List<String> items = ['Popular', 'Pizza', 'Top Rated', 'Pasta', 'Food'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              AnimatedDefaultTextStyle(
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito'),
                duration: Durations.long2,
                child: Text(
                  items.elementAt(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
