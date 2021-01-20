import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number1 = 1;
  int number2 = 1;

  void diceRool() {
    setState(() {
      number1 = Random().nextInt(6) + 1;
      number2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Dice rooling'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    diceRool();
                  });
                  print('image$number1 is clecked ');
                },
                child: Image.asset('images/dice$number1.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    diceRool();
                  });
                  print('image $number2 is clecked');
                },
                child: Image.asset('images/dice$number2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
