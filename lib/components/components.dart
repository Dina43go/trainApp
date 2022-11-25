import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todo;
  final String date;
  final bool checked;
  void Function(bool?)? onChange;
  TodoItem(
      {super.key,
      required this.todo,
      required this.date,
      this.checked = false,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo),
      subtitle: Text(date),
      trailing: Checkbox(
        value: checked,
        onChanged: onChange,
      ),
    );
  }
}

class Dialogue extends StatelessWidget {
  VoidCallback? saved;
  TextEditingController controller;
  Dialogue({super.key, required this.controller , required this.saved});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle(Color color) =>
        ButtonStyle(backgroundColor: MaterialStatePropertyAll(color));
    return AlertDialog(
      content: TextFormField(
        controller: controller,
        onChanged: (value) {},
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                  style: buttonStyle(Colors.blueGrey)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                  onPressed: saved,
                  child: Text('Add' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                  style: buttonStyle(
                    Colors.red,
                  )),
            )
          ],
        )
      ],
    );
  }
}
