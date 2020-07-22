import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streetwyze/blocs/authentication/authentication_bloc.dart';
import 'package:streetwyze/blocs/authentication/authentication_state.dart';
import 'package:streetwyze/config/router.dart';
import 'package:streetwyze/helpers/loading_indicator.dart';
import 'package:streetwyze/repository/settings_repo.dart' as settingRepo;
import 'package:streetwyze/config/settings.dart';

import 'package:streetwyze/config/app_config.dart' as config;
import 'package:streetwyze/repository/user_repo.dart';
import 'package:streetwyze/ui/screens/auth/login/login_page.dart';
import 'package:streetwyze/ui/screens/splash.dart';

class AppWidget extends StatefulWidget {
  final UserRepository userRepository;

  AppWidget({this.userRepository});
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingRepo.setting,
        builder: (context, Setting _setting, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Setting().appName,
            theme: _setting.brightness.value == Brightness.light
                ? ThemeData(
                    fontFamily: 'ProductSans',
                    primaryColor: Colors.green,
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                        elevation: 0, foregroundColor: Colors.brown),
                    brightness: Brightness.light,
                    accentColor: config.Colors().mainColor(1),
                    dividerColor: config.Colors().accentColor(0.1),
                    focusColor: config.Colors().accentColor(1),
                    hintColor: config.Colors().secondColor(1),
                    textTheme: TextTheme(
                      headline5: TextStyle(
                          fontSize: 22.0,
                          color: config.Colors().secondColor(1),
                          height: 1.3),
                      headline4: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().secondColor(1),
                          height: 1.3),
                      headline3: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().secondColor(1),
                          height: 1.3),
                      headline2: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().mainColor(1),
                          height: 1.4),
                      headline1: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          color: config.Colors().secondColor(1),
                          height: 1.4),
                      subtitle1: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: config.Colors().secondColor(1),
                          height: 1.3),
                      headline6: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().mainColor(1),
                          height: 1.3),
                      bodyText2: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: config.Colors().secondColor(1),
                          height: 1.2),
                      bodyText1: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: config.Colors().secondColor(1),
                          height: 1.3),
                      caption: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: config.Colors().accentColor(1),
                          height: 1.2),
                    ),
                  )
                : ThemeData(
                    fontFamily: 'ProductSans',
                    primaryColor: Color(0xFF252525),
                    brightness: Brightness.dark,
                    scaffoldBackgroundColor: Color(0xFF2C2C2C),
                    accentColor: config.Colors().mainDarkColor(1),
                    dividerColor: config.Colors().accentColor(0.1),
                    hintColor: config.Colors().secondDarkColor(1),
                    focusColor: config.Colors().accentDarkColor(1),
                    textTheme: TextTheme(
                      headline5: TextStyle(
                          fontSize: 22.0,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.3),
                      headline4: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.3),
                      headline3: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.3),
                      headline2: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().mainDarkColor(1),
                          height: 1.4),
                      headline1: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.4),
                      subtitle1: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.3),
                      headline6: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: config.Colors().mainDarkColor(1),
                          height: 1.3),
                      bodyText2: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.2),
                      bodyText1: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: config.Colors().secondDarkColor(1),
                          height: 1.3),
                      caption: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: config.Colors().secondDarkColor(0.6),
                          height: 1.2),
                    )),
            onGenerateRoute: Router.generateRoute,
            home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                //return Home page Here
                return LoginPage();
//          return HomePage();
              }

              if (state is AuthenticationUnauthenticated) {
                return LoginPage();
              }
              if (state is AuthenticationLoading) {
                return LoadingIndicator();
              }
              return SplashScreen();
            }),
          );
        });
  }
}
