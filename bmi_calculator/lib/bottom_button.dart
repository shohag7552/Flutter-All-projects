import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onClick;
  BottomButton({@required this.text, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        margin: EdgeInsets.only(top: 10),
        color: Color(0xFFEB1555),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
