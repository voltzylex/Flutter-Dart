import 'package:flutter/material.dart';

const primaryColor = Color(0xfffeca57);
const accentColor = Color(0xffff9f43);
const defaultContainer = Color(0xffEEF0F2);

extension BoxExtension on num {
  SizedBox get  heightbox => SizedBox(
        height: toDouble(),
      );
  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );
}
