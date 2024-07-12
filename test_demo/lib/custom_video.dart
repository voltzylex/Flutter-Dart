import 'package:flutter/material.dart';
import 'package:ivs_broadcaster/Player/Widget/ivs_player_view.dart';
import 'package:ivs_broadcaster/Player/ivs_player.dart';

class CustomVideo extends StatefulWidget {
  const CustomVideo({super.key});

  @override
  State<CustomVideo> createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  late IvsPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = IvsPlayer.instance;
    Future.delayed(
      const Duration(seconds: 0),
      () => _player.startPlayer(
        "https://d28wlus3z0btx7.cloudfront.net/ivs/v1/655758237974/TkU9oEEBXbzE/2024/6/26/9/2/ob7euxlmhZlY/media/hls/master.m3u8",
      ),
    );
  }

  @override
  void dispose() {
    _player.stopPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IvsPlayerView(controller: _player),
    );
  }
}
