// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/TaskData.dart';
import 'package:todolist/widgets/TaskTile.dart';

// This class represents a list of tasks.
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Consumer widget listens to changes in TaskData and rebuilds the UI accordingly
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        // ListView builder to efficiently build a list of tasks
        return ListView.builder(
          itemCount: taskData.tasks.length, // Number of tasks in the task list
          itemBuilder: (context, index) {
            // TaskTile widget representing each individual task in the list
            return TaskTile(
              taskTitle: taskData.tasks[index].name, // Title of the task
              isChecked: taskData.tasks[index]
                  .isDone, // Indicates if the task is checked or not
            );
          },
        );
      },
    );
  }
}
