import 'package:flutter/material.dart';

class AppConstants {
  static int fieldSize = 45;
  static double fieldBorderWidth = 0.2;

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static final List<Tab> myTabs = <Tab>[
    Tab(text: Labels.withPhone),
    Tab(text: Labels.withEmail),
  ];
}

class Labels {
  static String email = 'Email';
  static String password = 'Password';
  static String phone = 'Phone';

  static String withEmail = 'With Email';
  static String withPhone = 'With Phone';
}

class ButtonTitles {
  static String forgot = 'Forgot Password?';
  static String login = 'LOG IN';
}

class AppTitles {
  static String app = 'StreetWyze';
  static String login = 'Log In';
}

class AppTheme {
  static Color fieldTransparentBG() {
    return Color.fromRGBO(211, 211, 211, 0.1);
  }

  static Color themeBlue() {
    return Color.fromRGBO(4, 154, 160, 1.0);
  }

  static AssetImage appBG() {
    return AssetImage("assets/images/ic_bg.png");
  }

  static Image appLogo() {
    return Image.asset('assets/images/ic_logo.png');
  }

  static Image dropDown() {
    return Image.asset('assets/images/ic_arrowdown.png');
  }

  static Decoration bgDecoration() => BoxDecoration(
        image: DecorationImage(
          image: AppTheme.appBG(),
          fit: BoxFit.cover,
        ),
      );
}
