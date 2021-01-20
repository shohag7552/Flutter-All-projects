import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: Portfolio(),
  ));
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: Colors.white60,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 20,
                  
                ),
              ),
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/myPic.jpg'),
            ),
            SizedBox(height: 10,),
            Text('The Growing Developer',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15),
              height: 2,
              color: Colors.blue,
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.alternate_email),
                        SizedBox(width: 10,),
                        Text('mh85331@gmail.com',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.assessment),
                        SizedBox(width: 10,),
                        Text('Study',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(width: 10,),
                        Text('About',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 10,),
                        Text('Address',style: TextStyle(fontSize: 16),)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        
      ),
      
    );
  }
}