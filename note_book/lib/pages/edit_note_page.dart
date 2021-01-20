import 'package:flutter/material.dart';
import 'package:note_book/colors.dart';
import 'package:note_book/database_helper.dart';
import 'package:note_book/task.dart';

class EditNotePage extends StatefulWidget {
  final Task task;
  EditNotePage({@required this.task});
  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  int _id ;
  String _title = '';
  String _des = '';

  FocusNode _titleFocus;
  FocusNode _descFocus;
  bool _contentVisile = false;
  @override
  void initState() {
    if (widget.task != null) {
      _contentVisile = true;

      _title = widget.task.title;
      _des = widget.task.description;
    }
    _titleFocus = FocusNode();
    _descFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await _dbHelper.deleteNote(_id);
          Navigator.pop(context);
        },
        backgroundColor: appDeleteButtonColor,
        child: Icon(Icons.delete),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: appBackgroundColor,
          ),
          highlightColor: appBckgroundColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              size: 30,
              color: appBackgroundColor,
            ),
            highlightColor: appBckgroundColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                focusNode: _titleFocus,
                enableInteractiveSelection: true,
                autofocus: true,
                onSubmitted: (value) async {
                  if (value != '') {
                    if (widget.task == null) {
                      Task _newTask = Task(title: value);
                      _id = await _dbHelper.insertNote(_newTask);
                      print('new id $_id');
                      print('Titleee added');
                      setState(() {
                        _contentVisile = true;
                        _title = value;
                      });
                    } else {
                      print('Updated');
                      await _dbHelper.updateNoteTitle(_id, value);
                    }

                    _descFocus.requestFocus();
                  }
                  else{
                    print('Call');
                  }
                },
                controller: TextEditingController()..text = _title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                ),
              ),
            ),
            Visibility(
              visible: _contentVisile,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: TextEditingController()..text = _des,
                  focusNode: _descFocus,
                  onSubmitted: (value) async {
                    if(value != null){
                      if(_id != 0){
                        await _dbHelper.updateNoteDescription(_id, value);
                      }
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description of the note..'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
