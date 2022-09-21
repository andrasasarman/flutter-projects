import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

///
///
/// Add task screen
///
class AddTaskScreen extends StatelessWidget {
  ///
  /// Main constructor
  ///
  const AddTaskScreen({Key? key}) : super(key: key);

  ///
  /// AddTaskScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: _buildContent(context),
      ),
    );
  }

  ///
  /// Build a column with a title, a text input and a button
  ///
  Widget _buildContent(BuildContext context) {
    ///
    /// Used to save the user input
    ///
    String newTaskTitle = '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (value) {
            newTaskTitle = value;
          },
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
            Navigator.pop(context);
          },
          child: const Text(
            'Add',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }
}
