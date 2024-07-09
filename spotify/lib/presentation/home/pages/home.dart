import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';

import '../../../core/configs/assets/assets.dart';
import '../../../core/configs/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final textStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          Assets.assetsVectorsSpotifyLogo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _homeArtist(),
            20.h,
            _tabs(context),
          ],
        ),
      ),
    );
  }

  Widget _homeArtist() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(Assets.assetsVectorsHomeTopCard)),
            Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(Assets.assetsImagesHomeArtist))
                .padding(
              EdgeInsets.only(right: 60),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
          labelColor: context.isDarkMode ? AppColors.white : AppColors.black,
          indicatorColor: AppColors.primary,
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          tabs: [
            Text(
              "News",
              style: textStyle,
            ),
            Text(
              "Videos",
              style: textStyle,
            ),
            Text(
              "Artist",
              style: textStyle,
            ),
            Text(
              "Podcasts",
              style: textStyle,
            )
          ]),
    );
  }
}
