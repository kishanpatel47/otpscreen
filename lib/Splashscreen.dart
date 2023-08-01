import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:providerfullcourse/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(microseconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            )));
  }

  @override
  Widget splashimage() {
    return Container(
      child: Image(
          height: double.infinity,
          fit: BoxFit.scaleDown,
          image: NetworkImage(
              'https://flutterdesk.com/wp-content/uploads/2023/02/Flutter-provider.jpg')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: splashimage(),
      ),
    );
  }
}
