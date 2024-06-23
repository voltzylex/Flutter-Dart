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
          // final ValueNotifier<double> width = ValueNotifier(80);
          // final ValueNotifier<Color> shoppingColor = ValueNotifier(Colors.blue);
          // final ValueNotifier<double> radius = ValueNotifier(10);
          final ValueNotifier<bool> isExpanded = ValueNotifier(false);

          return InkWell(
            onTap: () {
              // shoppingColor.value = Colors.green;
              // radius.value = 30;
              // width.value = 180;
              isExpanded.value = !isExpanded.value;
            },
            child: ValueListenableBuilder<bool>(
                valueListenable: isExpanded,
                builder: (context, value, child) {
                  return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: isExpanded.value ? 200 : 80,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: isExpanded.value ? Colors.green : Colors.blue,
                        borderRadius:
                            BorderRadius.circular(isExpanded.value ? 30 : 10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            !isExpanded.value
                                ? Icons.done
                                : Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          if (isExpanded.value)
                            Text(
                              " Added to cart",
                              style: TextStyle(color: Colors.white),
                            )
                        ],
                      ));
                }),
          );
        }),
      ),
    );
  }
}
