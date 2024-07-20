import 'package:donut_app/data/database.dart';
import 'package:donut_app/widgets/my_button.dart';
import 'package:donut_app/widgets/to_do_note.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class ToDoNotesPage extends StatefulWidget {
  const ToDoNotesPage({super.key});

  @override
  State<ToDoNotesPage> createState() => _ToDoNotesPageState();
}

class _ToDoNotesPageState extends State<ToDoNotesPage> {

  final myBox = Hive.box("toDoNoteBox");
  ToDoNoteDatabase db = ToDoNoteDatabase();

  @override
  void initState() {

    if(myBox.get("TODONOTELIST") == null) {
      db.createInitialDatabase();
    } else {
      db.loadDatabase();
    }

    super.initState();
  }

  final controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoNoteList[index][1] = !db.toDoNoteList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoNoteList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        content: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(text: "Save", onPressed: saveNewTask),

                  const SizedBox(width: 10),

                  MyButton(text: "Cancel", onPressed: () => Navigator.of(context).pop()),
                ],
              ),


            ],
          ),
        ),
      );
    },);
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoNoteList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // bottomNavigationBar: Container(
      //   color: const Color.fromRGBO(100, 0, 0, 1),
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //     child: GNav(
      //       backgroundColor: Color.fromRGBO(100, 0, 0, 1),
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Color.fromARGB(255, 129, 20, 20),
      //       padding: EdgeInsets.all(15),
      //       tabs: [
      //         GButton(
      //           icon: Icons.home,
      //           text: "Home",
      //         ),
      //         GButton(
      //           icon: Icons.settings,
      //           text: "Settings"
      //         ),
      //         GButton(
      //           icon: Icons.info,
      //           text: "Info"
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: const Row(
          children: [
              Padding(
                padding: EdgeInsets.only(left: 1),
                child: Text(
                  'Donut',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Creattion-Demo',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.white),
        shape: CircleBorder(),
        backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            //search textfield
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20)
            //   ),
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(0),
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Colors.black,
            //         size: 20,
            //       ),
            //       prefixIconConstraints: BoxConstraints(
            //         maxHeight: 20,
            //         maxWidth: 25
            //       ),
            //       border: InputBorder.none,
            //       hintText: "Search",
            //     ),
            //   ),
            // ),

            //text all to do notes
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "All To Do Notes",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(100, 0, 0, 1)
                          ),
                        ),
                      ),
              ],
            ),

            //notes list builder
            ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: db.toDoNoteList.length,
                    itemBuilder: (context, index) {
                      return ToDoNote(taskName: db.toDoNoteList[index][0], taskComplete: db.toDoNoteList[index][1], onChanged: (value) => checkBoxChanged(value, index), deleteFunction: (context) => deleteTask(index));
                    },
                  ),

          ],
        ),
      ),
    );
  }
}