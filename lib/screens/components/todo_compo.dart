import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ComponentToDo extends StatelessWidget {
  final String task;
  final bool value;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFun;

  ComponentToDo({
    super.key,
    required this.task,
    required this.value,
    required this.onchanged,
    required this.deleteFun,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFun,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(25),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow[300],
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onchanged,
                activeColor: Colors.orange[300],
              ),
              Text(
                task,
                style: TextStyle(
                  decoration:
                      value ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
