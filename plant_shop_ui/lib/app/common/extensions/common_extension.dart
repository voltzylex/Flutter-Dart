import 'package:flutter/material.dart';

extension Pad on Widget {
  Widget pad(EdgeInsets pad) {
    return Padding(padding: pad, child: this);
  }
}

extension Box on num {
  SizedBox get h =>  SizedBox(height:toDouble());
  SizedBox get w => SizedBox(width:toDouble());
}
