import 'dart:developer';

import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation _curve;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_animation);
    _curve = CurvedAnimation(parent: _animation, curve: Curves.slowMiddle);
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween(begin: 30, end: 50),
        weight: 50,
      ),
      ...List.generate(
          1,
          (index) => TweenSequenceItem<double>(
                tween: Tween(
                    begin: index % 2 == 0 ? 30 : 50,
                    end: index % 2 == 0 ? 50 : 30),
                weight: 50,
              )),
      // TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 50),
      // TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 50),
    ]).animate(_animation);

    _animation.forward();
    _animation.addListener(() {
      // setState(() {});
      log("Animation ${_animation.value} ");
    });
    _animation.addStatusListener((status) {
      log("Animation Status ${status}");
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
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
        animation: _curve,
        builder: (context, child) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value ?? Colors.grey[400],
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              // if (_animation.status == AnimationStatus.completed) {
              //   _animation.reverse();
              // } else {
              //   _animation.forward();
              // }
              isFav ? _animation.reverse() : _animation.forward();
            },
          );
        });
  }
}
