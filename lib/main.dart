import 'package:calculator/splashscreen.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
//import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      home: CalsiMain(),
    ),
  );
}

class CalsiMain extends StatefulWidget {
  @override
  _CalsiMainState createState() => _CalsiMainState();
}

class _CalsiMainState extends State<CalsiMain> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
