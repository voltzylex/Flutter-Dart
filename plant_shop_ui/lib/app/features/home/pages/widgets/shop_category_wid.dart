import 'package:flutter/material.dart';

class ShopCategoryWid extends StatelessWidget {
  const ShopCategoryWid({super.key});
  static const List<String> categories = [
    "Indoor",
    "Popular",
    "Organic",
    "Synthetic"
  ];
  static final ValueNotifier<int> _selected = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => ValueListenableBuilder(
          valueListenable: _selected,
          builder: (context, value, child) => InkWell(
            onTap: () => _selected.value = value,
            child: Column(
              children: [
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                      fontSize: 20,
                      color: value == index ? Colors.green : Colors.grey),
                  duration: Durations.extralong1,
                  child: Text(categories[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
