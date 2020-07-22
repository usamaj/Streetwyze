import 'package:flutter/material.dart';

class ButtonWidgetHelper {
  static Widget buttonContainer(String title, Function onBtnPressed) =>
      FlatButton(
        child: Text(title),
        textColor: Colors.white,
        onPressed: () {
          print('$title pressed');
          onBtnPressed();
        },
      );
}
