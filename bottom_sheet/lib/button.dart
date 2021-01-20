import 'package:bottom_sheet/Comments/comment1.dart';
import 'package:bottom_sheet/Comments/comment3.dart';
import 'package:bottom_sheet/Comments/comment4.dart';
import 'package:bottom_sheet/Comments/comments2.dart';
import 'package:bottom_sheet/backArrow.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          showBottomSheet(
              context: context,
              builder: (context) {
                return sheetLayout(context);
              });
        });
      },
      child: Text(
        'Comments',
        style: TextStyle(fontFamily: 'IndieFlower'),
      ),
      color: Colors.green,
    );
  }

  Container sheetLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Colors.grey[200],
            boxShadow: [
          BoxShadow(
              color: Colors.grey, offset: Offset(-0.5, -0.5), blurRadius: 10)
        ]),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/myPic.jpg'),
                  radius: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/3.jpg'),
                  radius: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/2.jpg'),
                  radius: 10,
                ),
                Text(
                  '...',
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mehedi,Md.Meraj..',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 35,
                ),
                BackArrow(),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Container(
            
            child: Column(
              children: <Widget>[
                Divider(),
                comment1(),
                comment2(),
                comment3(),
                //comment4(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
