import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title:'Neumorpic button',
    home: Numorpic(),
  ));
}

class Numorpic extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => _NumorpicState();
}


class _NumorpicState extends State<Numorpic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Neumorpic'),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          height:150,
          width: 150,
          decoration: BoxDecoration(
            
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600],
                blurRadius: 15,
                spreadRadius: 1.0,
                offset: Offset(4.0, 4.0),
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1.0,
                offset: Offset(-4.0, -4.0),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[200],
                Colors.grey[300],
                Colors.grey[400],
                Colors.grey[500],
              ],
              stops: [0.1,0.3,0.8,1],
            ),
          ),
          child: Center(
            child: Text('S',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          
        ),
      ),
    );
  }
}

