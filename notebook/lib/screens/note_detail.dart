import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{

  String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBarTitle);
  }
}
class NoteDetailState extends State<NoteDetail>{

  static var _priority = ['high','low'];

  String appBarTitle;

  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return WillPopScope(
      onWillPop: (){
        // Code to contorl back Button in appbar
        moveToLastScreen();
      },
        child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
             onPressed: (){
               moveToLastScreen();
             }
             ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top:15.0,left: 10.0,right: 10.0),
          child: ListView(
            children: <Widget>[

              //first element..
              ListTile(
                title: DropdownButton(
                  items: _priority.map((String dropDownStringItems){
                    return DropdownMenuItem<String>(
                      value: dropDownStringItems,
                      child:Text(dropDownStringItems),
                      );
                  }).toList(),

                  style: textStyle,

                  value: 'low',

                  onChanged: (select){
                    setState(() {
                      debugPrint('user select $select');
                    });
                  },
                  ),
              ),

              //second element...
              Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: titleControler,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint("something changed");
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

                //third element...
              Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: TextField(
                  controller: descriptionControler,
                  style: textStyle,
                  onChanged: (value){
                    debugPrint("something changed description");
                  },
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //forth element
              Padding(
                padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child:RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Colors.black,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.0,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint("Save button pressed");
                          });
                        },
                        ) ,
                    ),

                    Container(width: 10.0),

                    Expanded(
                      child:RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Colors.black,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.0,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint("Delete button pressed");
                          });
                        },
                        ) ,
                    ),
                  ],
                ),
                ),

            ],
          ),
          ),
      ),
    );
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}