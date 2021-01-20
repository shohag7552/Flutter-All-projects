import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/pic.jpg'),
              radius: 50,
            ),
            Text(
              'Mehedi Hasan',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[50],
                  fontFamily: 'Pacifico'),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                  color: Colors.blueGrey[200],
                  fontSize: 18,
                  fontFamily: 'Source Sans Pro',
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  color: Colors.cyan.shade100,
                )),
            SizedBox(
              height: 10,
            ),
            Card(
                color: Colors.white70,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+8801677696277',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 18,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                title: Text(
                  'mh85331@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
