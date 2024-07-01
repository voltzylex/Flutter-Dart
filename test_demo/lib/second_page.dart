import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.id});
  final String id;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second page"),
      ),
      body: Center(
        child: Text("Second page ${widget.id}"),
      ),
    );
  }
}
