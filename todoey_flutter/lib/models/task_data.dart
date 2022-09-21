import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

///
///
/// Contains the logic(everithing we can do with a list of tasks or a task)
///
class TaskData extends ChangeNotifier {
  ///
  /// The private list of tasks
  ///
  final List<Task> _tasks = [
    Task('Buy milk'),
    Task('Buy bread'),
    Task('Buy eggs'),
  ];

  ///
  /// Getter used to obtain an unmodifiable copy of [_tasks]
  ///
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  ///
  /// Getter used to obtain the number of tasks
  ///
  int get taskCount {
    return _tasks.length;
  }

  ///
  /// Method used to add atask in the list
  ///
  void addTask(String newTaskTitle) {
    final task = Task(newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  ///
  /// Method used to update the completeness of a task
  ///
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  ///
  /// Method used to delete a task
  ///
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
