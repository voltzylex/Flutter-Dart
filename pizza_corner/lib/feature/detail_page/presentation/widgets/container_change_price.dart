import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_corner/core/assets.dart';

import '../../../../core/const.dart';
import 'myWidget.dart';

class ContainerChangePrice extends StatefulWidget {
  const ContainerChangePrice(
      {super.key,
      required this.title,
      required this.description,
      required this.myWidget,
      required this.prices});
  final String title, description;
  final ValueNotifier myWidget;
  final List<String> prices;
  @override
  State<ContainerChangePrice> createState() => _ContainerChangePriceState();
}

class _ContainerChangePriceState extends State<ContainerChangePrice> {
  int itemSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontFamily: nunito),
        ),
        const SizedBox(height: 10),
        Text(
          widget.description,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: nunito),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  itemSelected = index;
                  widget.myWidget.value = (index == 0)
                      ? MyWidget(
                          price: widget.prices[0],
                          key: const ValueKey(1),
                        )
                      : (index == 1)
                          ? MyWidget(
                              price: widget.prices[1],
                              key: const ValueKey(2),
                            )
                          : MyWidget(
                              price: widget.prices[2],
                              key: const ValueKey(3),
                            );
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(15),
                width: 90,
                decoration: (itemSelected == index)
                    ? BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30))
                    : BoxDecoration(
                        color: defaultContainer,
                        borderRadius: BorderRadius.circular(30),
                      ),
                child: (index == 0)
                    ? const Text('S',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))
                    : (index == 1)
                        ? const Text('M',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))
                        : const Text('L',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        MaterialButton(
          onPressed: () {},
          color: Colors.amber,
          //  splashColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Check Out',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    fontSize: 25),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                width: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                child: SvgPicture.asset(
                  'assets/icons/bag.svg',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
