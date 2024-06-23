import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: Builder(builder: (context) {
          final ValueNotifier<double> width = ValueNotifier(80);
          final ValueNotifier<Color> shoppingColor = ValueNotifier(Colors.blue);
          final ValueNotifier<double> radius = ValueNotifier(10);
          return InkWell(
            onTap: () {
              shoppingColor.value = Colors.green;
              radius.value = 30;
              width.value = 180;
            },
            child: ValueListenableBuilder<double>(
                valueListenable: width,
                builder: (context, value, child) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: width.value,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: shoppingColor.value,
                      borderRadius: BorderRadius.circular(radius.value),
                    ),
                    child: radius.value == 30
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                              Text(
                                " Added to cart",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        : const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
