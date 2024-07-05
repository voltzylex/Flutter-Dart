import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/app_bar.dart';
import 'package:spotify/core/configs/assets/assets.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          Assets.assetsVectorsSpotifyLogo,
          height: 20,
          width: 20,
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
