import 'package:crud/data/database.dart';
import 'package:crud/screens/components/add_items.dart';
import 'package:crud/screens/components/todo_compo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void onchanged(bool? val, int index) {
    setState(() {
      db.todoList[index][1] = val;
    });
    db.updateDB();
  }

  void add(txt) {
    setState(() {
      db.todoList.add([txt, false]);
    });
    db.updateDB();
  }

  void remove(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDB();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (ctx) {
          return DialogeBox(
            ctx: ctx,
            todo: db.todoList,
            add: (txt) => add(txt),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'TO DO',
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ComponentToDo(
            task: db.todoList[index][0],
            value: db.todoList[index][1],
            onchanged: (value) => onchanged(value, index),
            deleteFun: (ctx) => remove(index),
          );
        },
      ),
    );
  }
}
