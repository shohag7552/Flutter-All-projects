import 'package:notebook/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;   //singleton DatabaseHelper
  static Database _database;
  
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle ='title';
  String colDescription = 'descripton';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper.createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper.createInstance();

    }
    return _databaseHelper;
  }
  Future<Database> get database async{
    
    if(_database == null){
      _database = await initilizeDatabase();
    }
    return _database;
  }

  Future<Database> initilizeDatabase() async {
    //Get directory path for both ios and android to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //open/create database at the given path
    var notesDatabase = openDatabase(path, version: 1, onCreate:_createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVirtion) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMSRY KEY AUTOINCREMENT, $colTitle TEXT,'
    '$colDescription TEXT, $colPriority INTEGER, $colDate TEXT');
  }

  //Fetch Operation: get all Note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async{
    Database db = await this.database;

    var result = await db.query(noteTable,orderBy: '$colPriority ASC');
    return result;
  }
  //Insert Operation: Insert a note object to database
  Future<int> insertNote(Note note) async{
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }
  //Update Operation:Update note and save it to database
  Future<int> updateNote(Note note) async{
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(),where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }
  //Delete Operation: Delete note object from database
  Future<int> deleteNote(int id) async{
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }
  //Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}