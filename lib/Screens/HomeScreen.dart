// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Screens/ImportantScreen.dart';
import 'package:todolist/Screens/TasksScreen.dart';
import 'package:todolist/models/TaskData.dart';
import '../models/TaskCategorie.dart';

// This screen represents the home screen of the application
class HomeScreen extends StatelessWidget {
  // Method to navigate to the tasks screen
  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(TasksScreen.screenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar for the home screen
      appBar: AppBar(
        backgroundColor: Colors.blue, // Background color of the app bar
        foregroundColor: Colors.white, // Foreground color of the app bar
        leading: const Icon(Icons.list, size: 30), // Icon on the leading side
        title: const Text(
          'Home Screen', // Title of the app bar
          style: TextStyle(
            fontSize: 25, // Font size of the title
            fontWeight: FontWeight.bold, // Font weight of the title
          ),
        ),
      ),
      // Body of the home screen
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Aligning items vertically to the start
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretching items horizontally
        children: [
          // Container for the main sections
          Container(
            // Styling for the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius:
                  BorderRadius.circular(15), // Border radius of the container
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Color of the shadow
                  blurRadius: 5, // Blur radius of the shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(20), // Padding for the container
            margin: const EdgeInsets.all(10), // Margin around the container
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // InkWell for "My Day" section
                InkWell(
                  onTap: () => selectScreen(context),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.wb_sunny, // Icon for "My Day"
                        color: Colors.blue, // Color of the icon
                        size: 30,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'My Day', // Title of "My Day" section
                        style: TextStyle(
                          fontSize: 25, // Font size of the title
                          fontWeight:
                              FontWeight.bold, // Font weight of the title
                          color: Colors.blue, // Color of the title
                        ),
                      ),
                      const Spacer(),
                      // Displaying the number of tasks
                      Text(
                        '${Provider.of<TaskData>(context).tasks.length} tasks',
                        style: const TextStyle(
                          fontSize: 18.0, // Font size of the text
                          color: Colors.grey, // Color of the text
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Divider between sections
                Divider(
                  height: 3.0, // Height of the divider
                  color: Colors.grey[300], // Color of the divider
                ),
                const SizedBox(
                  height: 20,
                ),
                // InkWell for "Upcoming" section
                InkWell(
                  onTap: () => selectScreen(context),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month, // Icon for "Upcoming" section
                        color: Colors.blue, // Color of the icon
                        size: 30,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Upcoming', // Title of "Upcoming" section
                        style: TextStyle(
                          fontSize: 25, // Font size of the title
                          fontWeight:
                              FontWeight.bold, // Font weight of the title
                          color: Colors.blue, // Color of the title
                        ),
                      ),
                      const Spacer(),
                      // Displaying the number of tasks
                      Text(
                        '${Provider.of<TaskData>(context).tasks.length} tasks',
                        style: const TextStyle(
                          fontSize: 18.0, // Font size of the text
                          color: Colors.grey, // Color of the text
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // Divider between sections
                Divider(
                  height: 3.0, // Height of the divider
                  color: Colors.grey[300], // Color of the divider
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // InkWell for "Important" section
                InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed(ImportantScreen.screenRoute),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star, // Icon for "Important" section
                        color: Colors.blue, // Color of the icon
                        size: 30,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Important', // Title of "Important" section
                        style: TextStyle(
                          fontSize: 25, // Font size of the title
                          fontWeight:
                              FontWeight.bold, // Font weight of the title
                          color: Colors.blue, // Color of the title
                        ),
                      ),
                      const Spacer(),
                      // Displaying the number of important tasks
                      Text(
                        '${Provider.of<TaskData>(context).importantTasks.length} tasks',
                        style: const TextStyle(
                          fontSize: 18, // Font size of the text
                          color: Colors.grey, // Color of the text
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20, // Spacing between sections
          ),
          // Row for task categories
          Row(
            children: [
              // InkWell for "Personal" category
              InkWell(
                onTap: () => selectScreen(context),
                child: TaskCategorie(
                  icon: Icons.person, // Icon for "Personal" category
                  title: 'Personal', // Title of "Personal" category
                  taskCount:
                      '${Provider.of<TaskData>(context).tasks.length} Tasks', // Number of tasks
                  color: Colors.blue, // Color of the category
                ),
              ),
              const Spacer(),
              // InkWell for "Learning" category
              InkWell(
                onTap: () => selectScreen(context),
                child: TaskCategorie(
                  icon: Icons.edit, // Icon for "Learning" category
                  title: 'Learning', // Title of "Learning" category
                  taskCount:
                      '${Provider.of<TaskData>(context).tasks.length} Tasks', // Number of tasks
                  color: Colors.green, // Color of the category
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15, // Spacing between categories
          ),
          // Row for task categories
          Row(
            children: [
              // InkWell for "Work" category
              InkWell(
                onTap: () => selectScreen(context),
                child: TaskCategorie(
                  icon: Icons.work, // Icon for "Work" category
                  title: 'Work', // Title of "Work" category
                  taskCount:
                      '${Provider.of<TaskData>(context).tasks.length} Tasks', // Number of tasks
                  color: Colors.orange, // Color of the category
                ),
              ),
              const Spacer(),
              // InkWell for "Shopping" category
              InkWell(
                onTap: () => selectScreen(context),
                child: TaskCategorie(
                  icon: Icons.shopping_cart, // Icon for "Shopping" category
                  title: 'Shopping', // Title of "Shopping" category
                  taskCount:
                      '${Provider.of<TaskData>(context).tasks.length} Tasks', // Number of tasks
                  color: Colors.purple, // Color of the category
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
