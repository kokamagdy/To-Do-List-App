// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/TaskData.dart';

// TaskTile widget displays a single task with a checkbox and an option to mark it as important
class TaskTile extends StatelessWidget {
  // Properties of the TaskTile widget
  final String taskTitle; // Title of the task
  final bool isChecked; // Indicates whether the task is checked or not

  // Constructor for TaskTile
  TaskTile({
    required this.taskTitle, // Required task title
    required this.isChecked, // Required boolean indicating if task is checked
  });

  @override
  Widget build(BuildContext context) {
    // ListTile widget representing the task with leading, title, and trailing elements
    return ListTile(
      // Leading element is an InkWell with an icon to mark task as important
      leading: InkWell(
        onTap: () {
          // Toggles the importance of the task when tapped
          Provider.of<TaskData>(context, listen: false)
              .toggleImportantTask(taskTitle);
        },
        child: Icon(
          // Icon changes based on whether the task is important or not
          Provider.of<TaskData>(context).isTaskImportant(taskTitle)
              ? Icons.star // Filled star icon if task is important
              : Icons
                  .star_border_outlined, // Outline star icon if task is not important
          color: Provider.of<TaskData>(context).isTaskImportant(taskTitle)
              ? Colors
                  .blue // Blue color for filled star icon if task is important
              : Colors
                  .grey, // Grey color for outline star icon if task is not important
        ),
      ),
      // Title element displays the task title with optional strikethrough if task is checked
      title: Text(
        taskTitle, // Display the task title
        style: TextStyle(
          decoration: isChecked
              ? TextDecoration.lineThrough
              : null, // Apply strikethrough if task is checked
        ),
      ),
      // Trailing element is a Checkbox to mark the task as checked or unchecked
      trailing: Checkbox(
        activeColor: Colors.blue, // Color for the checkbox when active
        value:
            isChecked, // Set the initial checkbox value to indicate if task is checked or not
        onChanged: (newValue) {
          // Update the task status when the checkbox value changes
          Provider.of<TaskData>(context, listen: false).updateTask(taskTitle);
        },
      ),
    );
  }
}
