import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/assets.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.assetsImagesChooseModeBg,
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
                  "Choose Mode",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                21.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () => context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark),
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.ovalGrey.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  Assets.assetsVectorsMoon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.h,
                        const Text(
                          "Dark Mode",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey),
                        )
                      ],
                    ),
                    40.w,
                    Column(
                      children: [
                        InkWell(
                          onTap: () => context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark),
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.ovalGrey.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  Assets.assetsVectorsSun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.h,
                        const Text(
                          "Light Mode",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                20.h,
                BasicAppButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseModePage(),
                        )),
                    title: "Continue")
              ],
            ).padding(const EdgeInsets.symmetric(vertical: 40, horizontal: 40)),
          ),
          // use black color for a overlay effect on the scree
        ],
      ),
    );
  }
}
