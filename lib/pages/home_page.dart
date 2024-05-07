import 'package:flutter/material.dart';
import 'package:test/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['Learn Flutter', false],
    ['Perfect React native', false],
  ];

  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTasks() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 244, 244),
        appBar: AppBar(
          title: const Text('Todo Application'),
          backgroundColor: Color.fromARGB(255, 95, 144, 90),
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, index) {
              return TodoList(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(index),
                deleteFunction: (context) => deleteTask(index),
              );
            }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: 'Add a new todo item...',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 164, 180, 164),
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 87, 116, 89),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 155, 180, 142),
                          ),
                          borderRadius: BorderRadius.circular(15))),
                ),
              )),
              FloatingActionButton(
                onPressed: saveNewTasks,
                child: const Icon(Icons.add),
                backgroundColor: Color.fromARGB(255, 88, 125, 78),
                foregroundColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
