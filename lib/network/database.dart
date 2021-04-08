import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/models/task.dart';

class Database {
  final CollectionReference _usersDatabase =
      FirebaseFirestore.instance.collection('Users');

  Future<DocumentSnapshot> getTasks() async {
    print(FirebaseAuth.instance.currentUser.uid);
    return await _usersDatabase
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
  }

  Future updateTasks(List<Task> tasks) async {
    
    await _usersDatabase.doc(FirebaseAuth.instance.currentUser.uid).set({
      'tasks': [tasks[0].toJson()]
    });

    for (int i = 1; i < tasks.length; i++) {
      await _usersDatabase.doc(FirebaseAuth.instance.currentUser.uid).update({
        'tasks': FieldValue.arrayUnion([tasks[i].toJson()])
      });
    }
  }

  Future removeTask(Task task) async {
    await _usersDatabase.doc(FirebaseAuth.instance.currentUser.uid).update({
      'tasks': FieldValue.arrayRemove([task.toJson()])
    });
  }
}
