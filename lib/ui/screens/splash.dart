import 'package:flutter/material.dart';
import 'package:streetwyze/config/settings.dart';
import 'package:streetwyze/ui/widgets/common/text_widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Setting.appColor,
      body: Center(
        child:TextWidgets.customTextWidget('PHILLIP\nJEFFRIES', Colors.white, 60.0, FontWeight.normal),
      ),
    );
  }
}
