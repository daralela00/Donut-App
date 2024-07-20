import 'package:hive_flutter/hive_flutter.dart';

class ToDoNoteDatabase{
  List toDoNoteList = [];

  final myBox = Hive.box("toDoNoteBox");

  void createInitialDatabase() {
    toDoNoteList = [
      ["Do homework", false],
      ["Do exercise", false]
    ];
  }

  void loadDatabase() {
    toDoNoteList = myBox.get("TODONOTELIST");
  }

  void updateDatabase() {
    myBox.put("TODONOTELIST", toDoNoteList);
  }
}