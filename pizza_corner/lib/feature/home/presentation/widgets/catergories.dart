import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pizza_corner/core/assets.dart';
import 'package:pizza_corner/core/const.dart';

class Catergories extends StatelessWidget {
  const Catergories({super.key});

  @override
  Widget build(BuildContext context) {
    log("Category");
    final size = MediaQuery.sizeOf(context);
    final List<String> items = [
      'Popular',
      'Pizza',
      'Top Rated',
      'Pasta',
      'Food'
    ];
    ValueNotifier<double> v = ValueNotifier(0.0);

    return SizedBox(
      height: size.height / 14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            v.value = index.toDouble();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ValueListenableBuilder(
                valueListenable: v,
                builder: (context, value, _) {
                  bool isSelected = value == index;
                  return Column(
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: Durations.medium2,
                        style: TextStyle(
                            fontSize: isSelected ? 21 : 19,
                            color:
                                isSelected ? Colors.amber[700] : Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: nunito),
                        child: Text(
                          items.elementAt(index),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Durations.medium2,
                        height: 5.0,
                        width: isSelected ? 20 : 0,
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
