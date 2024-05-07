// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todolist/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Screens/ImportantScreen.dart';
import 'package:todolist/Screens/TasksScreen.dart';
import 'package:todolist/models/TaskData.dart';
import 'package:todolist/widgets/TaskTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List to hold important tasks
  List<TaskTile> importantTasks = [];

  // Method to manage important tasks
  void manageImportantTasks(String taskTitle) {
    final existingIndex =
        importantTasks.indexWhere((element) => element.taskTitle == taskTitle);
    if (existingIndex >= 0) {
      setState(() {
        // Remove task if it already exists
        importantTasks.removeAt(existingIndex);
      });
    } else {
      setState(() {
        // Add task if it doesn't exist
        importantTasks.add(
          TaskTile(
            taskTitle: taskTitle,
            isChecked: false,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Creating a MaterialApp widget with Provider for state management
    return ChangeNotifierProvider(
      create: (context) => TaskData(), // Providing TaskData instance
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Disabling the debug banner
        initialRoute: '/', // Initial route for the app
        routes: {
          '/': (ctx) => HomeScreen(), // Home screen route
          TasksScreen.screenRoute: (ctx) => TasksScreen(
                importantTasks: [],
              ), // Tasks screen route
          ImportantScreen.screenRoute: (ctx) =>
              ImportantScreen(), // Important screen route
        },
      ),
    );
  }
}
