// ignore_for_file: avoid_function_literals_in_foreach_calls, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/TaskData.dart';
import 'package:todolist/widgets/TaskTile.dart';

// This screen displays the list of important tasks
class ImportantScreen extends StatelessWidget {
  // Route name for navigation
  static const screenRoute = '/ImportantScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the screen
      appBar: AppBar(
        title: const Text('Important Tasks'), // Title of the app bar
      ),
      // Body of the screen
      body: Consumer<TaskData>(
        builder: (context, taskData, child) {
          // List to hold important tasks
          List<Task> importantTasks = [];
          // Iterate through all tasks to find the important ones
          taskData.tasks.forEach((task) {
            // Check if the task is important
            if (taskData.isTaskImportant(task.name)) {
              // Add the important task to the list
              importantTasks.add(task);
            }
          });
          // Display the list of important tasks using a ListView builder
          return ListView.builder(
            itemCount: importantTasks.length, // Number of important tasks
            itemBuilder: (context, index) {
              final task =
                  importantTasks[index]; // Get the task at the current index
              // Display the TaskTile widget for the important task
              return TaskTile(
                taskTitle: task.name, // Title of the task
                isChecked:
                    task.isDone, // Indicates if the task is checked or not
              );
            },
          );
        },
      ),
    );
  }
}
