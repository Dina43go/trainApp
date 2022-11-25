import 'package:app/screens/Todo/todo_view.dart';
import 'package:app/components/components.dart' as components;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController? controller;
  List<Map<String, dynamic>> todos = [
    {"todo": "First task", "date": "11/11/2022", "checked": false},
    {"todo": "First task", "date": "11/11/2022", "checked": false},
    {"todo": "First task", "date": "11/11/2022", "checked": false}
  ];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void onChenge(int index) {
    setState(() {
      todos[index]['checked'] = !todos[index]['checked'];
    });
    debugPrint(todos[index]['checked'].toString());
  }

  void addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => components.Dialogue(
        controller: controller!,
        saved: () {
          setState(() {
            todos.add({
              "todo": controller!.text,
              "date": DateFormat.yMd().format(DateTime.now()),
              "checked": false
            });
          });
          controller!.text = "";
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void deleteTask() {
    setState(() {
      todos.removeWhere((e) => e['checked']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Todo(todos: todos, onPressed: onChenge),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todos.where((e) => e['checked'] == true).toList().isEmpty
              ? addTask(context)
              : deleteTask();
        },
        child: Icon(todos.where((e) => e['checked'] == true).toList().isEmpty
            ? Icons.add
            : Icons.delete),
      ),
    );
  }
}
