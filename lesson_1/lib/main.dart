import 'package:flutter/material.dart';
import 'package:ninja_trips/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ninja Trips',
      home: Home(),
    );
  }
}

// Learned Mixins
// A a = A();

// void chain() {
//   a.hello();
//   a.bye();
//   a.hi();
// }
// class A extends B with C {
//   void hello() {
//     print('Hello');
//   }
// }
// class B {
//   void bye() {
//     print('Bye');
//   }
// }
// mixin C{
//   void hi() {
//     print('Hi');
//   }
// }