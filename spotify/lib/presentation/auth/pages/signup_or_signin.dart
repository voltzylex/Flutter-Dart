import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignupOrSignin extends StatelessWidget {
  // static route() => MaterialPageRoute(builder: (context) => const SignupOrSignin());
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(Assets.assetsVectorsTopPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Assets.assetsVectorsBottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              Assets.assetsImagesAuthBg,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.assetsVectorsSpotifyLogo),
                55.h,
                const Text(
                  "Enjoy Listening To Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                21.h,
                const Text(
                  " Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
                30.h,
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: BasicAppButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ),
                                ),
                            title: "Register")),
                    10.w,
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: context.isDarkMode
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).padding(const EdgeInsets.symmetric(horizontal: 40)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
