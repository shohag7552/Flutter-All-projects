import 'package:bottom_sheet/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font App'),
        centerTitle: true,
        titleSpacing: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Facebook Comments\n       layout',
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'IndieFlower',
              ),
            ),
            Button(),
          ],
        ),

      ),
    );
  }
}