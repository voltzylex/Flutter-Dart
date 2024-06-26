import 'package:flutter/material.dart';

class ContainerImagePrice extends StatefulWidget {
  final Image image;
  final int index;
  final Widget myWidget;

  const ContainerImagePrice(
      {super.key,
      required this.image,
      required this.index,
      required this.myWidget});
  @override
  // ignore: library_private_types_in_public_api
  _ContainerImagePriceState createState() => _ContainerImagePriceState();
}

class _ContainerImagePriceState extends State<ContainerImagePrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Positioned(
            right: -70,
            top: 80,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.amber.withOpacity(0.2),
                ),
              ),
              child: Hero(
                tag: '${widget.index}',
                child: widget.image,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 190,
            child: Container(
              height: 120,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                  child: widget.myWidget,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
