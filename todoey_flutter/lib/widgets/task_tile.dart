import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String task;
  final Function onChanged;
  final Function onLongPress;
  TaskTile({this.isChecked, this.task, this.onChanged, this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        task,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
