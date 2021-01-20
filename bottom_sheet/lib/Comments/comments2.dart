import 'package:flutter/material.dart';

Container comment2() {
    return Container(
        child: Column(
          children: <Widget>[
              Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/2.jpg'),
            ),
            SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.all(10),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Mehedi Hasan',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1
                ),),
                  Text('An end-aligned row of buttons,\nlaying out into a column if there\nis not enough horizontal \nspace.',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.5
                ),)

              ],
              ),
            )
          ],
        ),
      ),

      Container(
        child: Row(
          children: <Widget>[
            SizedBox(width: 75,),
            Text('1 d',style: TextStyle(color: Colors.grey[600]),),
            SizedBox(width: 15,),
            Text('Like',style: TextStyle(color: Colors.grey[800]),),
            SizedBox(width: 15,),
            Text('Reply',style: TextStyle(color: Colors.grey[800]),),
          ],
        ),
      ),
          ],
        ),
      );
  }