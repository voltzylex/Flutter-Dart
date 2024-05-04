import 'dart:developer';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  @override
  void initState() {
    super.initState();
    _animation = AnimationController(duration: Durations.medium2, vsync: this);
    _animation.forward();
    _animation.addListener(() {
      log("Animation ${_animation.value} ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.grey[400],
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
