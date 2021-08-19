import 'package:flutter/material.dart';

class MyBottons extends StatelessWidget {
  final color;
  final textColor;
  final String? buttonText;
  final buttonTapped;

  MyBottons({this.color, this.textColor, this.buttonText, this.buttonTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              color: color,
              child: Center(
                child: Text(buttonText ?? '',
                    style: TextStyle(color: textColor, fontSize: 20)),
              )),
        ),
      ),
    );
  }
}
