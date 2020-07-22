import 'package:flutter/material.dart';
import 'package:streetwyze/config/Constants.dart';

// Worked on this

class FieldWidgetHelper {
  static Widget textContainer(double borderWidht, TextInputType type,
          TextEditingController controller) =>
      TextField(
        controller: controller,
        style: TextStyle(fontSize: 15),
        keyboardType: type,
        decoration: InputDecoration(
          fillColor: AppTheme.fieldTransparentBG(),
          filled: true,
          contentPadding:
              EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: borderWidht),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: borderWidht, color: Colors.white),
          ),
        ),
      );
}
