import 'package:flutter/material.dart';
import 'package:plant_shop_ui/app/common/extensions/common_extension.dart';

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
            builder: (context, value, child) {
              bool isSelected = value == index;
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  _selected.value = index;
                },
                child: Column(
                  children: [
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                          fontSize: isSelected ? 21 : 20,
                          color: value == index ? Colors.green : Colors.grey),
                      duration: Durations.short4,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : null),
                      ),
                    ),
                    2.h,
                    AnimatedContainer(
                      duration: Durations.medium2,
                      height: 5.0,
                      width: isSelected ? 30 : 0,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              );
            }).pad(const EdgeInsets.symmetric(horizontal: 10)),
      ),
    );
  }
}
