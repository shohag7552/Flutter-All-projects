import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tap = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Ask me anything'),
      ),
      body: Container(
        child: Center(
          child: Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    tap = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset('images/ball$tap.png')),
          ),
        ),
      ),
    );
  }
}
