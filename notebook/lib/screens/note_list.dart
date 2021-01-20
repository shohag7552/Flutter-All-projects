import 'package:flutter/material.dart';
import 'package:notebook/screens/note_detail.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}
class NoteListState extends State<NoteList>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Notes'),
      ),
      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigatorToDetail('Add Note ');
        },
        tooltip: "Add Note",
        child: Icon(Icons.add),
      ),
    );
  }
  ListView getNoteListView(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context,int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_right),
            ),
            title: Text("Title of something"),
            subtitle: Text("something.."),
            trailing: Icon(Icons.delete,color: Colors.red[200]),

            onTap: (){
              navigatorToDetail('Edit Note');
            },
          ),
        );
      }
      );
  }
  void navigatorToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(title);
    }));
  }
}