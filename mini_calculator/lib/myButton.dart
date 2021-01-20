import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final color;
  final textColor;
  final String bottomText;
  final buttonTap;
  MyButtom({this.color, this.textColor, this.bottomText, this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: buttonTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              bottomText,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
