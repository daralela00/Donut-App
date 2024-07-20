import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//ignore: must_be_immutable
class ToDoNote extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoNote({
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color.fromRGBO(100, 0, 0, 1),
            )
          ],
        ),
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
        
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: const Color.fromRGBO(100, 0, 0, 1),
              ),
        
              Text(
                taskName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  decoration: taskComplete ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}