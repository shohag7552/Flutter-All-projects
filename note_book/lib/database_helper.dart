import 'package:note_book/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'note.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, description TEXT)",
        );
        return db;
      },
      version: 1,
    );
  }

  Future<int> insertNote(Task task) async {
    int taskId = 0;
    final Database _db = await database();
    await _db
        .insert('notes', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateNoteTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateNoteDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<List<Task>> retriveNote() async {
    Database _db = await database();

    // Query the table for all The Task.
    List<Map<String, dynamic>> maps = await _db.query('notes');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Task(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
      );
    });
  }

//   Future<void> updateNote(Task task) async {
//     // Get a reference to the database.
//     final Database db = await database();

//     // Update the given task.
//     await db.update(
//       'notes',
//       task.toMap(),
//       // Ensure that the Dog has a matching id.
//       where: "id = ?",
//       // Pass the Dog's id as a whereArg to prevent SQL injection.
//       whereArgs: [task.id],
//     );
//   }

   Future<void> deleteNote(int id) async {
     // Get a reference to the database.
     final Database db = await database();

     // Remove the Dog from the Database.
     await db.delete(
       'notes',
       // Use a `where` clause to delete a specific dog.
       where: "id = ?",
       // Pass the Dog's id as a whereArg to prevent SQL injection.
       whereArgs: [id],
     );
   }
}
