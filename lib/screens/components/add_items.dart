import 'package:flutter/material.dart';

class DialogeBox extends StatelessWidget {
  final BuildContext ctx;
  final List todo;
  Function(String) add;

  DialogeBox(
      {super.key, required this.ctx, required this.todo, required this.add});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editingController = TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        color: Colors.yellow[300],
        child: TextField(
          controller: editingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Add A Task',
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.orange[300]),
          ),
        ),
        TextButton(
          onPressed: () {
            add(editingController.text);
            Navigator.of(ctx).pop();
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.orange[300]),
          ),
        ),
      ],
    );
  }
}
