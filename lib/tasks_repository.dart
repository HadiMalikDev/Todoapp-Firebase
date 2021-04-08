import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/network/database.dart';

class TasksRepository {
  final Database _database = Database();
  List<Task> tasks = [];

  Future<dynamic> loadTasks() async {
    DocumentSnapshot documentSnapshot = await _database.getTasks();
    if (documentSnapshot.data() == null) return null;

    int length = documentSnapshot.data()["tasks"].length;

    if (length == 0) return null;

    for (int i = 0; i < length; i++) {
      tasks.add(_convertToTask(documentSnapshot.data()["tasks"][i]));
    }
    return tasks;
  }

  Task _convertToTask(Map<String, dynamic> task) {
    return Task(title: task['title'], description: task['description']);
  }

  Future addTask(Task task) async {
    tasks.add(task);
    await _database.updateTasks(tasks);
  }

  removeTask(int index) async {    
    Task task=tasks.removeAt(index);
      await _database.removeTask(task);
  }

  updateTaskAtIndex(int index, Task task) async {
    tasks[index] = task;
    await _database.updateTasks(tasks);
  }
}
