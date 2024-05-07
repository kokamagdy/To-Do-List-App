// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Class representing a task
class Task {
  final String name; // Name of the task
  bool isDone; // Flag indicating if the task is done or not

  // Constructor for Task class
  Task({
    required this.name, // Required parameter: name of the task
    this.isDone =
        false, // Optional parameter: default value for isDone is false
  });

  // Method to toggle the done status of the task
  void toggleDone() {
    isDone = !isDone; // Flips the value of isDone
  }
}

// Class representing the data for tasks
class TaskData extends ChangeNotifier {
  List<Task> tasks = []; // List to store tasks
  List<String> importantTasks = []; // List to store important tasks

  // Method to add a new task
  void addTask(String newTaskTitle) {
    tasks.add(Task(
        name: newTaskTitle)); // Creating a new task and adding it to the list
    notifyListeners(); // Notifying listeners of changes
  }

  // Method to update the status of a task
  void updateTask(String taskTitle) {
    int index = tasks.indexWhere(
        (task) => task.name == taskTitle); // Finding the index of the task
    tasks[index].toggleDone(); // Toggling the done status of the task
    notifyListeners(); // Notifying listeners of changes
  }

  // Method to delete a task
  void deleteTask(Task task) {
    final index = tasks.indexWhere(
        (t) => t.name == task.name); // Finding the index of the task
    if (index != -1) {
      tasks.removeAt(index); // Removing the task from the list
      notifyListeners(); // Notifying listeners of changes
    }
  }

  // Method to toggle the importance of a task
  void toggleImportantTask(String taskTitle) {
    if (isTaskImportant(taskTitle)) {
      importantTasks.remove(
          taskTitle); // Removing task from important tasks if already marked as important
    } else {
      importantTasks.add(
          taskTitle); // Adding task to important tasks if not marked as important
    }
    notifyListeners(); // Notifying listeners of changes
  }

  // Method to check if a task is marked as important
  bool isTaskImportant(String taskTitle) {
    return importantTasks.contains(
        taskTitle); // Checking if the task is in the list of important tasks
  }
}
