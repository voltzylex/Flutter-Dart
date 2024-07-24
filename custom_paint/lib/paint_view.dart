import 'package:flutter/material.dart';

class ShapeView extends StatefulWidget {
  const ShapeView({super.key});

  @override
  State<ShapeView> createState() => _ShapeViewState();
}

class _ShapeViewState extends State<ShapeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shape"),
      ),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,
          child: CustomPaint(
            size: const Size(300, 400),
            painter: MasterPainter(),
          ),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Colors.red;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
    canvas.drawCircle(
        Offset((size.width / 2) + 10, (size.height / 2) + 10), 40, paint);

    // canvas.drawRect(Rect.fromCircle(center: center, radius: 40), paint);
    // canvas.drawRect(Rect.fromLTWH(50, 50, size.width, size.height), paint);
    canvas.drawRect(const Rect.fromLTRB(50, 50, 200, 200), paint);
  }

  @override
  bool shouldRepaint(MasterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MasterPainter oldDelegate) => false;
}
