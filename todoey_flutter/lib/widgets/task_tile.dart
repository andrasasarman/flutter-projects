import 'package:flutter/material.dart';

///
///
/// Used to display a task in a ListTile
///
class TaskTile extends StatelessWidget {
  ///
  /// Default is false
  /// Verify if the checkbox is checked
  ///
  final bool isChecked;

  ///
  /// Used for the ListTile title
  ///
  final String taskTitle;

  ///
  /// Callback used in onChange method(Checkbox widget)
  ///
  final Function(bool?) checkboxCallback;

  ///
  /// Callback used in onLongPress method(ListTile widget)
  ///
  final void Function() longPressCallback;

  ///
  /// Main constructor
  ///
  const TaskTile(this.taskTitle,
      {Key? key,
      this.isChecked = false,
      required this.checkboxCallback,
      required this.longPressCallback})
      : super(key: key);

  ///
  /// TaskTile builder
  ///
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback),
    );
  }
}
