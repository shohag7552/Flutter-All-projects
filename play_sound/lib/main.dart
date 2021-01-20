import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Piano(),
    ),
  );
}

class Piano extends StatelessWidget {
  final red = Colors.red;

  void play(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Widget show(Color c, int i) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: () {
          play(i);
        },
        color: c,
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            show(red, 1),
            show(Colors.blue, 2),
            show(Colors.green, 3),
            show(Colors.yellow, 4),
            show(Colors.orange, 5),
            show(Colors.purple, 2),
          ],
        ),
      ),
    );
  }
}
