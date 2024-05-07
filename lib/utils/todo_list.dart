// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                foregroundColor: Color.fromARGB(255, 70, 112, 60),
                borderRadius: BorderRadius.circular(10),
              )
            ]),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: !taskCompleted
                      ? Color.fromARGB(255, 95, 144, 90)
                      : Color.fromARGB(255, 159, 184, 163),
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Checkbox(
                      value: taskCompleted,
                      onChanged: onChanged,
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                )),
          ),
        ));
    ;
  }
}
