import 'package:flutter/material.dart';
class BackArrow extends StatefulWidget {
  @override
  _BackArrowState createState() => _BackArrowState();
}

class _BackArrowState extends State<BackArrow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          child: Icon(Icons.arrow_forward_ios),
          onTap: () {
            setState(() {
              Navigator.pop(context);
            });
          },
    );
  }
}