import 'package:flutter/material.dart';
import 'package:plant_shop_ui/app/common/extensions/common_extension.dart';
import 'package:plant_shop_ui/app/features/home/pages/widgets/shop_category_wid.dart';
import 'package:plant_shop_ui/app/features/home/pages/widgets/welcome_wid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeWid(),
          const Text(
            "Plant Shop",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          searchField(),
          const ColoredBox(color: Colors.red, child: ShopCategoryWid()),
        ],
      ).pad(const EdgeInsets.symmetric(horizontal: 10)),
    );
  }

  Widget searchField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.all(15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
        10.w,
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              fixedSize: const Size(50, 50),
              padding: EdgeInsets.zero),
          child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.tune,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ).pad(const EdgeInsets.symmetric(vertical: 30));
  }
}
