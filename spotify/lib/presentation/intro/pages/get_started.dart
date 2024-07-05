import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
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
                  "Lorem ksdff sdfjsdk kjasdkfjk kjdskj dskjsdkfjdks dkj ksdfsdk fsdkfsdj fdksfkj",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                20.h,
                BasicAppButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseModePage(),
                        )),
                    title: "Get Started")
              ],
            ).padding(EdgeInsets.symmetric(vertical: 40, horizontal: 40)),
          ),
          // use black color for a overlay effect on the scree
        ],
      ),
    );
  }
}
