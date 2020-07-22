import 'package:flutter/material.dart';
import 'package:streetwyze/config/Constants.dart';
import 'package:streetwyze/helpers/CustomWidgets/RowWidgets.dart';
import 'package:streetwyze/helpers/CustomWidgets/TextWidgets/TextWidgetHelper.dart';
import 'package:streetwyze/helpers/CustomWidgets/TextWidgets/FieldWidgetHelper.dart';

enum loginType { email, phone }

class LoginFields {
  static Container rowWith(loginType type, TextEditingController emailCt) {
    if (type == loginType.phone) {
      return Container(
        height: 45,
        margin: EdgeInsets.only(left: 20, right: 20),
        child: RowWidgets.phoneRow(emailCt),
      );
    }
    return Container(
      height: 45,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: FieldWidgetHelper.textContainer(
          AppConstants.fieldBorderWidth, TextInputType.text, emailCt),
    );
  }

  static Column loginWith(loginType type, TextEditingController emailCt,
      TextEditingController passwordCt) {
    // check for which tab is currently selected & rendering changes
    String fieldLabel = Labels.email;
    if (type == loginType.phone) {
      fieldLabel = Labels.phone;
    }
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20, left: 20),
          child:
              TextWidgetHelper.textContainer(fieldLabel, 10, FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        LoginFields.rowWith(type, emailCt),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: TextWidgetHelper.textContainer(
              Labels.password, 10, FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 45,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: FieldWidgetHelper.textContainer(AppConstants.fieldBorderWidth,
              TextInputType.visiblePassword, passwordCt),
        )
      ],
    );
  }
}
