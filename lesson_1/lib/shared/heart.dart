import 'dart:developer';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_animation);
    _animation.forward();
    _animation.addListener(() {
      // setState(() {});
      log("Animation ${_animation.value} ");
    });
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value ?? Colors.grey[400],
              size: 30,
            ),
            onPressed: () {
              if (_animation.status == AnimationStatus.completed) {
                _animation.reverse();
              } else {
                _animation.forward();
              }
            },
          );
        });
  }
}
