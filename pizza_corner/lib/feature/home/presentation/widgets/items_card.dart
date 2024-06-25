import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:pizza_corner/core/assets.dart';
import 'package:pizza_corner/core/const.dart';
import 'package:pizza_corner/feature/home/domain/models/pizza.dart';

class ItemsCard extends StatefulWidget {
  const ItemsCard({super.key});

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  TextStyle get commonStyle => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: nunito,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      child: PageView.builder(
        controller: pageController,
        itemCount: listPizza.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: 0.5 / 0.55,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(
                      bottom: 0, left: 20, right: 20, top: 50),
                  decoration: BoxDecoration(
                    color: defaultContainer,
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage(
                          Assets.background,
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listPizza.elementAt(index).title,
                        style: commonStyle,
                      ),
                      5.heightbox,
                      Text(
                        listPizza.elementAt(index).description,
                        style: commonStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      5.heightbox,
                      Text(
                        listPizza.elementAt(index).prices.first,
                        style: commonStyle,
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  double value = 0;
                  if (pageController.position.haveDimensions) {
                    // log("Page position is :  has page : ${pageController.page} dimension : ${pageController.position.haveDimensions}");

                    value = index - pageController.page!;
                    value = (value * 0.5).clamp(-1, 1);
                  }
                  return Hero(
                      tag: "project_manager",
                      child: Transform.rotate(
                        angle: -pi * value,
                        child: listPizza.elementAt(index).image,
                      ));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
