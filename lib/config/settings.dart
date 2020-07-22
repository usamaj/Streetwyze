import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  String appName = 'Prayer Tracker';
  ValueNotifier<Locale> mobileLanguage = new ValueNotifier(Locale('en', ''));
  String appVersion;
  bool enableVersion = true;
  String googleMapsKey;
  ValueNotifier<Brightness> brightness = new ValueNotifier(Brightness.light);
  String mainColor;
  String mainDarkColor;
  String secondColor;
  String secondDarkColor;
  String accentColor;
  String accentDarkColor;
  String scaffoldDarkColor;
  String scaffoldColor;
  static Color appColor = Colors.blue;

  Setting();
}
