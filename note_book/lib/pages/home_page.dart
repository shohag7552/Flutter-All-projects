import 'package:flutter/material.dart';
import 'package:note_book/database_helper.dart';
import 'package:note_book/pages/edit_note_page.dart';

import '../colors.dart';
import '../noteCardWidget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    DatabaseHelper _databaseHelper = DatabaseHelper();
    return Scaffold(
        backgroundColor: appBackgroundColor,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditNotePage(
                  task: null,
                );
              })).then((value) {
                setState(() {});
              });
            },
            backgroundColor: Colors.green,
            child: Icon(
              Icons.add,
              size: 35,
              color: appBackgroundColor,
            )),
         appBar: AppBar(
           backgroundColor: Colors.green,
           elevation: 2.0,
           actions: <Widget>[
             IconButton(
               icon: Icon(
                 Icons.search,
                 size: 30,
                 color: appTextTitleColor,
               ),
               onPressed: () {},
             ),
             SizedBox(
               width: 10,
             ),
           ],
         ),
        body: SafeArea(
          child: Container(
            child: FutureBuilder(
                initialData: [],
                future: _databaseHelper.retriveNote(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 5.0),
                      itemBuilder: (context, index) {
                        return NoteCard(
                          title: snapshot.data[index].title,
                          des: snapshot.data[index].description,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditNotePage(
                                task: snapshot.data[index],
                                
                              );
                            })).then((value) {
                              setState(() {

                              });
                            });
                          },
                        );
                      });
                }),
          ),
        ));
  }
}
