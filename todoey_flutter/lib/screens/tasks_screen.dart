import 'package:flutter/material.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/add_task_modal.dart';
import 'package:todoeyflutter/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {

  String tasksText(int count){
    return count == 1 ? "1 task" : "$count tasks";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              // Create new task
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                context: context,
                // To have the AddTaskModal sit just above the keyboard:
                // wrap it inside a SingleChildScrollView,
                // which determines the padding at the bottom using a MediaQuery.
                isScrollControlled: true, // This makes the modal full screen
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskModal(
//                      onAddPressed: (taskTitle) {
//                        if (taskTitle != null) {
////                      setState(() {
////                        Provider.of<TaskData>(context).tasks.add(
////                          Task(name: taskTitle),
////                        );
////                      });
//                          Navigator.pop(context);
//                        }
//                      },
                    ),
                  ),
                ),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
          backgroundColor: Colors.lightBlueAccent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24.0,
                        child: Icon(
                          Icons.list,
                          size: 24.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "Todoey",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tasksText(taskData.tasksCount),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: TasksList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
