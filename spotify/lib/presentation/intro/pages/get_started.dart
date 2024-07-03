import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const SizedBox(
          //   height: double.infinity,
          //   width: double.infinity,
          //   child: DecoratedBox(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         fit: BoxFit.fill,
          //         image: AssetImage(Assets.assetsImagesIntroBg),
          //       ),
          //     ),
          //   ),
          // ),
          Image.asset(
            Assets.assetsImagesIntroBg,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          SafeArea(
            child: Column(
              children: [
                SvgPicture.asset(Assets.assetsVectorsSpotifyLogo),
                const Spacer(),
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                21.h,
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          // use black color for a overlay effect on the scree
        ],
      ),
    );
  }
}
