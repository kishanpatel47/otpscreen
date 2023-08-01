import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providerfullcourse/Login.dart';
import 'package:providerfullcourse/Splashscreen.dart';
import 'package:providerfullcourse/route/otpscreen.dart';
import 'package:providerfullcourse/route/route_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );
      case RouteName.Login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case RouteName.otpscreen:
        return MaterialPageRoute(
          builder: (context) => otpscreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('No Page Found'),
          ),
        );
    }
  }
}
