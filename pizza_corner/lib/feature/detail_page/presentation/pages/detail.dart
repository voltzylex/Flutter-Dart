import 'package:flutter/material.dart';
import 'package:pizza_corner/feature/detail_page/presentation/widgets/container_image_price.dart';

import '../../../home/domain/models/pizza.dart';
import '../widgets/myWidget.dart';

class Detail extends StatelessWidget {
  static Route route(int index, Pizza pizza) => MaterialPageRoute(
      builder: (context) => Detail(index: index, pizza: pizza));
  final int index;
  final Pizza pizza;
  const Detail({super.key, required this.index, required this.pizza});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Widget> myWidget = ValueNotifier(MyWidget(
      key: const ValueKey(1),
      price: pizza.prices[0],
    ));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.95),
              const Color.fromARGB(255, 32, 4, 4).withOpacity(0.9),
              Colors.black.withOpacity(0.95),
            ],
            stops: const [0.0, 0.4, 0.8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            ContainerImagePrice(
              image: pizza.image,
              index: index,
              myWidget: myWidget.value,
            ),
          ],
        ),
      ),
    );
  }
}
