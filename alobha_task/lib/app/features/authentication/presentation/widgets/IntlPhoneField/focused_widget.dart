import 'package:flutter/material.dart';

class FocusedColorWidget extends StatefulWidget {
  const FocusedColorWidget({super.key});

  @override
  _FocusedColorWidgetState createState() => _FocusedColorWidgetState();
}

class _FocusedColorWidgetState extends State<FocusedColorWidget> {
  final FocusNode _focusNode = FocusNode();
  Color _widgetColor = Colors.grey; // Default color when not focused

  @override
  void initState() {
    super.initState();
    // Add a listener to the FocusNode to track focus changes
    _focusNode.addListener(() {
      setState(() {
        // Change color based on focus state
        _widgetColor = _focusNode.hasFocus ? Colors.blue : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the FocusNode when the widget is removed
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focused Color Widget')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: _focusNode,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: _widgetColor, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: _widgetColor, width: 2.0),
                ),
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: _widgetColor, // Set color based on focus state
              child:
                  const Center(child: Text('Box', textAlign: TextAlign.center)),
            ),
          ],
        ),
      ),
    );
  }
}
