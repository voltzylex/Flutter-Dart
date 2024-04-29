import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin = 20;
  double _opacity = 1;
  Color _color = Colors.amber;
  double _width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        color: _color,
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
              child: Text("Animate Margin"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.blue;
                });
              },
              child: Text("Animate Color"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _width = 400;
                });
              },
              child: Text("Animate Width"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  setState(() {
                    _opacity = _opacity == 0 ? 1 : 0;
                  });
                });
              },
              child: Text("Animate Text"),
            ),
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: _opacity,
              child: Text(
                "Hide Me",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
