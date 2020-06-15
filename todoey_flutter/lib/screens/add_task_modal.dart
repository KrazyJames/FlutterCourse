import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class AddTaskModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (value) {
                taskTitle = value;
              },
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(taskTitle);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
