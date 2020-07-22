import 'package:flutter/material.dart';
import 'package:streetwyze/config/Constants.dart';
import 'package:streetwyze/helpers/CustomWidgets/TextWidgets/FieldWidgetHelper.dart';

import 'TextWidgets/ButtonWidgetHelper.dart';
import 'TextWidgets/TextWidgetHelper.dart';

// Worked on this

class RowWidgets {
  static Row phoneRow(TextEditingController _emailCt) => Row(
        children: <Widget>[
          Container(
            color: AppTheme.fieldTransparentBG(),
            width: 120,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, width: AppConstants.fieldBorderWidth),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: dropDownContainer(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: FieldWidgetHelper.textContainer(
                AppConstants.fieldBorderWidth, TextInputType.number, _emailCt),
          )
        ],
      );

  static Row dropDownContainer() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/ic_flag.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 12),
            child:
                TextWidgetHelper.textContainer('+345', 12, FontWeight.normal),
          ),
          Container(
            width: 8,
            height: 8,
            child: AppTheme.dropDown(),
          ),
        ],
      );

  static Row loginForgotBtns(Function onLogin, Function onForgot) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonWidgetHelper.buttonContainer(ButtonTitles.forgot, onForgot),
          Container(
            width: 120,
            height: 45,
            child:
                ButtonWidgetHelper.buttonContainer(ButtonTitles.login, onLogin),
            decoration: BoxDecoration(
                color: AppTheme.themeBlue(),
                borderRadius: BorderRadius.circular(25.0)),
          )
        ],
      );
}
