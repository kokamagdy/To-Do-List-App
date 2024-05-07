// ignore_for_file: file_names

import 'package:flutter/material.dart';

// Widget representing a task category
class TaskCategorie extends StatelessWidget {
  // Constructor for TaskCategorie widget
  const TaskCategorie({
    Key? key,
    required this.title, // Title of the task category
    required this.taskCount, // Number of tasks in the category
    required this.color, // Color of the category
    required this.icon, // Icon of the category
  }) : super(key: key);

  final String title; // Title of the task category
  final String taskCount; // Number of tasks in the category
  final Color color; // Color of the category
  final IconData icon; // Icon of the category

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null, // No action on tap for now
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: color, // Setting the background color of the container
            borderRadius: BorderRadius.circular(
                15.0), // Setting border radius for rounded corners
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon, // Setting the icon of the category
                  size: 30,
                  color: Colors.white, // Setting the color of the icon
                ),
                Text(
                  title, // Setting the title of the category
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Setting the color of the title
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  taskCount, // Setting the number of tasks in the category
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Setting the color of the task count
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
