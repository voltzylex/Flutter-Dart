import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pizza_corner/core/assets.dart';
import 'package:pizza_corner/core/const.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                Assets.menu,
                color: Colors.white,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: "Pizza",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: nunito,
                  ),
                  children: [
                    TextSpan(
                      text: 'corner',
                      style: TextStyle(
                        color: Colors.amber[700],
                      ),
                    ),
                  ]),
            ),
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset(
                Assets.bag,
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              color: Colors.white,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: defaultContainer,
            borderRadius: BorderRadius.circular(40),
          ),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.7),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search",
                hintStyle: const TextStyle(
                    fontFamily: nunito,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87)),
          ),
        ),
      ],
    ));
  }
}
