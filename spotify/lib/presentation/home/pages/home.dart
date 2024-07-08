import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';

import '../../../core/configs/assets/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            _tabs(),
          ],
        ),
      ),
    );
  }

  Widget _homeArtist() {
    return Center(
      child: Container(
        height: 188,
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

  Widget _tabs() {
    return DefaultTabController(
      length: 4,
      child: TabBar(tabs: [
        Text("News"),
        Text("Videos"),
        Text("Artist"),
        Text("Podcasts")
      ]),
    );
  }
}
