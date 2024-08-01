import 'package:flutter/material.dart';
import 'package:ios_native_method/app/core/configs/theme/colors.dart';

class Background extends StatelessWidget {
  const Background(
      {super.key,
      required this.body,
      this.appBar,
      this.background = AppColors.transparent,
      this.bottom = false,
      this.top = false,
      this.right = false,
      this.left = false,
      this.safeArea = false})
      : assert(
          !(safeArea == false &&
              (top == true || bottom == true || right == true || left == true)),
          "Cannot set top, bottom, right, or left to true while safeArea is false",
        );

  /// Safe area is false default [safeArea] after safe area is true
  ///  you can change the parameter like top,bottom,right,left
  final bool safeArea;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? background;
  final bool bottom, top, right, left;

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
                    blurRadius: 200,
                    spreadRadius: 100,
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
          SafeArea(
            bottom: !safeArea ? bottom : true,
            left: !safeArea ? bottom : true,
            right: !safeArea ? bottom : true,
            top: !safeArea ? bottom : true,
            child: Scaffold(
              backgroundColor: background,
              appBar: appBar,
              body: body,
            ),
          ),
        ],
      ),
    );
  }
}
