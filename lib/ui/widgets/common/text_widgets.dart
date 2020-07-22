import 'package:flutter/material.dart';

class TextWidgets{

  static Widget customTextWidget(
    String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: '',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}
}