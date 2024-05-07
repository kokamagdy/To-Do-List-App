// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/TaskData.dart';

// This screen allows users to add a new task
class AddTaskScreen extends StatelessWidget {
  // Route name for navigation
  static const screenRoute = '/addTaskScreen';

  // Callback function to add a new task
  final Function addTaskCallback;

  // Constructor for AddTaskScreen
  const AddTaskScreen({required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    // Variables to hold the new task title and description
    String? newTaskTitle;
    String? newTaskDescription;

    return Container(
      padding: const EdgeInsets.all(30), // Padding for the container
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretching items horizontally
        children: [
          const Text(
            'Add Task', // Title of the screen
            textAlign: TextAlign.center, // Aligning text to the center
            style: TextStyle(
              color: Colors.indigo, // Color of the text
              fontSize: 30, // Font size of the text
              fontWeight: FontWeight.bold, // Font weight of the text
            ),
          ),
          TextField(
            autofocus: true, // Automatically opens the keyboard
            textAlign: TextAlign.center, // Aligning text to the center
            onChanged: (newText) {
              newTaskTitle = newText; // Updating the new task title
            },
          ),
          const SizedBox(
            height: 30, // Spacing between text field and button
          ),
          // Button to add the task
          TextButton(
            onPressed: () {
              // Adding the new task to the task list
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              // Closing the screen after adding the task
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              primary: Colors.white, // Text color of the button
              backgroundColor: Colors.blue, // Background color of the button
            ),
            child: const Text('Add',
                style: TextStyle(fontSize: 20)), // Text on the button
          ),
        ],
      ),
    );
  }
}
