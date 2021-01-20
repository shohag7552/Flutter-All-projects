import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color buttonColor;
  RoundedButton({this.title, this.textColor,this.buttonColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
