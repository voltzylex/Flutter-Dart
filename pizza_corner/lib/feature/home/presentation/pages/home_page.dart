import 'package:flutter/material.dart';
import 'package:pizza_corner/feature/home/presentation/widgets/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.95),
              const Color.fromARGB(255, 32, 4, 4).withOpacity(0.9),
              Colors.black.withOpacity(0.95),
            ],
            stops: const [0, 0.4, 0.8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Body(),
      ),
    );
  }
}
