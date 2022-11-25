import 'package:app/components/components.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  List<Map<String, dynamic>> todos;
  final void Function(int index)? onPressed;
  Todo({super.key, required this.todos, required this.onPressed});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Todo",
                  style: TextStyle(fontSize: 50, color: Colors.red),
                ),
                Text(
                  "${widget.todos.where((e) => e['checked'] == true).toList().length}/${widget.todos.length}",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TodoItem(
                  todo: widget.todos[index]['todo'],
                  date: widget.todos[index]['date'],
                  checked: widget.todos[index]['checked'],
                  onChange: (fase) {
                    widget.onPressed!(index);
                  },
                ),
                const SizedBox(height: 6),
              ],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: TodoItem(
                todo: widget.todos[index]['todo'],
                date: widget.todos[index]['date'],
                checked: widget.todos[index]['checked'],
                onChange: (fase) {
                  widget.onPressed!(index);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
