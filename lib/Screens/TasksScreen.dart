// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Screens/AddTaskScreen.dart';
import 'package:todolist/models/TaskData.dart';
import 'package:todolist/widgets/TaskTile.dart';
import 'package:todolist/widgets/TasksList.dart';

// This screen displays the list of tasks
class TasksScreen extends StatelessWidget {
  late final List<TaskTile> importantTasks; // List of important tasks

  // Constructor for TasksScreen
  TasksScreen({
    required this.importantTasks, // Required list of important tasks
  });

  // Route name for navigation
  static const screenRoute = '/TasksScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating action button to add new tasks
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show bottom sheet to add new task
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                // Container to handle keyboard overflow
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(addTaskCallback: (newTaskTitle) {}),
              ),
            ),
          );
        },
        backgroundColor: Colors.blue, // Background color of FAB
        child: const Icon(
          Icons.add, // Icon for adding new task
          size: 30,
          color: Colors.white, // Color of the icon
        ),
      ),
      // Background color of the screen
      backgroundColor: Colors.white,
      body: Container(
        // Padding for the content
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App title and icon
            Row(
              children: [
                const Icon(
                  Icons.playlist_add_check, // Icon representing tasks
                  color: Colors.blue, // Color of the icon
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'To Do App', // Title of the app
                  style: TextStyle(
                    color: Colors.blue, // Color of the text
                    fontSize: 30, // Font size of the text
                    fontWeight: FontWeight.bold, // Font weight of the text
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Close the screen on tap
                  },
                  child: const Icon(
                    Icons.close, // Icon for closing the screen
                    color: Colors.blue, // Color of the icon
                    size: 30,
                  ),
                ),
              ],
            ),
            // Number of tasks
            Text(
              '${Provider.of<TaskData>(context).tasks.length} tasks', // Display number of tasks
              style: const TextStyle(
                color: Colors.blue, // Color of the text
                fontSize: 20, // Font size of the text
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                // Container for the tasks list
                decoration: const BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.all(
                    Radius.circular(20), // Border radius of the container
                  ),
                ),
                child: TasksList(), // Display the list of tasks
              ),
            )
          ],
        ),
      ),
    );
  }
}
