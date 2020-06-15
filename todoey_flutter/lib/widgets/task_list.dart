import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.getTaskAt(index);
            return TaskTile(
              task: task.name,
              isChecked: task.isDone,
              onChanged: (checkboxSate) {
                taskData.updateTask(task);
              },
              onLongPress: () {
                if (task.isDone) {
                  taskData.deleteTask(index);
                }
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
