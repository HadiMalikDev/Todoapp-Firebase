import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class ModifyTask extends StatelessWidget {
  final Task task;
  const ModifyTask({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Task task1 = task;
    String title;
    String description;
    GlobalKey<FormState> key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context, "remove task");
            },
            tooltip: "Delete Task",
          ),
        ],
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
                  initialValue: task1.title,
                  validator: (val) {
                    if (val == null)
                      return 'Please enter Title';
                    else
                      title = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Task Title",
                    labelStyle: TextStyle(fontSize: 20),
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
                  initialValue: task1.description,
                  validator: (val) {
                    if (val == null)
                      return 'Please enter Description';
                    else
                      description = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Task Description",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (key.currentState.validate()) {
                    Navigator.pop(
                        context, Task(title: title, description: description));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                child: Text(
                  "Save",
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
