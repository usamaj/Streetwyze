import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No rout defined for'),
                  ),
                ));
    }
  }
}
