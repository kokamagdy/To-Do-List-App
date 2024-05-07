// ignore_for_file: file_names

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
  void doneChange() {
    isDone = !isDone; // Flips the value of isDone
  }
}
