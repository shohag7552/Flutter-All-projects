import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  CardLayout({@required this.color, this.cardChild, this.onCardTap});
  final Color color;
  final Widget cardChild;
  final Function onCardTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: cardChild,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
