import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/tasks_repository.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    String description;
    GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Add Task"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: key,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  validator: (val) {
                    if (val == null)
                      return 'Please enter Title';
                    else
                      title = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Task Title",
                    icon: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  maxLines: 10,
                  validator: (val) {
                    if (val == null)
                      return 'Please enter Description';
                    else
                      description = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Task Description",
                    icon: Icon(
                      Icons.info,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState.validate()) {
                    TasksRepository tasksRepository = TasksRepository();
                    await tasksRepository.loadTasks();
                    await tasksRepository
                        .addTask(Task(title: title, description: description));
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
