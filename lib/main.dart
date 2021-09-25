import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(ForkCalsi());

class ForkCalsi extends StatefulWidget {
  @override
  _ForkCalsiState createState() => _ForkCalsiState();
}

class _ForkCalsiState extends State<ForkCalsi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/logo.png'),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 1000,
        duration: 3000,
        backgroundColor: Colors.red,
        nextScreen: HomePage(),
      ),
    );
  }
}
