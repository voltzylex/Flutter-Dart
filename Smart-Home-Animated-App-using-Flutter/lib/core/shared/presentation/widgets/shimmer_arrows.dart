import 'package:flutter/material.dart';

import '../../../theme/sh_icons.dart';

class ShimmerArrows extends StatefulWidget {
  const ShimmerArrows({super.key});

  @override
  State<ShimmerArrows> createState() => _ShimmerArrowsState();
}

class _ShimmerArrowsState extends State<ShimmerArrows> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController.unbounded(vsync: this)..repeat(
      min: -0.5,max: 1.5,period: Durations.extralong4
    );
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context,child) {
        return ShaderMask(
          shaderCallback: (bounds) =>  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [Colors.white10, Colors.white, Colors.white10],
            stops:const  [0.0, 0.3, 1],
            transform: _SliderGradientTransform(percentage: _animationController.value)
          ).createShader(bounds),
          child: const Column(
            children: [
              Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
              Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
              Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
            ],
          ),
        );
      }
    );
  }
}
class _SliderGradientTransform extends GradientTransform{
  final double percentage;

  _SliderGradientTransform({required this.percentage});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0,(bounds.height*percentage) , 0);

  }
}

