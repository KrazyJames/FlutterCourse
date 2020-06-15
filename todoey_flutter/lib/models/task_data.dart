import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy milk"),
  ];

  void addTask(String title){
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  Task getTaskAt(int index){
    return _tasks[index];
  }

  String getTaskNameAt(int index){
    return _tasks[index].name;
  }

  bool getTaskDoneAt(int index) {
    return _tasks[index].isDone;
  }

  int get tasksCount {
    return _tasks.length;
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

}