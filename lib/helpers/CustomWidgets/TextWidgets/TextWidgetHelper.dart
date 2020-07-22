import 'package:flutter/material.dart';

class TextWidgetHelper {
  static Widget textContainer(
          String title, double fontsize, FontWeight fontWeight) =>
      Text(
        title,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontsize),
      );
}
