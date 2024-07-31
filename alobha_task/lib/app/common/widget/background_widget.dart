import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key,
      required this.body,
      this.appBar,
      this.background = AppColors.transparent});

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    final shadowColor = AppColors.backgroundGradient.withOpacity(0.09);

    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: AppColors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 50,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 50,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: background,
            appBar: appBar,
            body: body,
          ),
        ],
      ),
    );
  }
}
