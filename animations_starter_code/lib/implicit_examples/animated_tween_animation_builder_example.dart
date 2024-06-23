import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: TweenAnimationBuilder(
        duration: Duration(seconds: 4),
        tween: Tween<double>(begin: 0, end: 200),
        builder: (context, size, _) {
          return Center(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: _,
            ),
          );
        },
        child: Text("Hello World"),
      ),
    );
  }
}
