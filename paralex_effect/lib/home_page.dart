import 'dart:developer';

import 'package:flutter/material.dart';

class ParalexEffect extends StatefulWidget {
  const ParalexEffect({super.key});

  @override
  State<ParalexEffect> createState() => _ParalexEffectState();
}

class _ParalexEffectState extends State<ParalexEffect> {
  // List of text string to display on each page
  List<String> texts = [
    'Parallax Effect',
    'Beauty of Nature',
    'Power of Flower',
    ' Just Feel It',
    'Himalayan Look',
  ];

  // ScrollController to track and manage the scroll position
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
    _controller.addListener(
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, index) {
            double yAxis = _controller.hasClients
                ? (-(index * size.height) + _controller.position.pixels) / 2
                : 1.0;
            // -((0*852)+3000)/2
            log("YAxix : $yAxis : Size of height is : ${size.height}");
            log("Scroll pixel : ${_controller.position.pixels}");
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: Container(
                    transform: Matrix4.identity()..translate(0.0, yAxis),
                    height: size.height,
                    width: size.width,
                    child: Image.asset(
                      "assets/image${index + 1}.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    texts[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
