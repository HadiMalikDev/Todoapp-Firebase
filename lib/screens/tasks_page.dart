import 'package:flutter/material.dart';
import 'package:todolist/screens/modify_task.dart';
import 'package:todolist/screens/new_task.dart';
import 'package:todolist/tasks_repository.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    TasksRepository tasksRepository = TasksRepository();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: FutureBuilder(
          future: tasksRepository.loadTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Container(
                  child: Text("NO TASKS"),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.black,
                    title: Text(
                      snapshot.data[index].title,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    subtitle: Text(
                      snapshot.data[index].description,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    onTap: () async {
                      dynamic result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModifyTask(
                            task: snapshot.data[index],
                          ),
                        ),
                      );
                      if (result == "remove task") {
                        await tasksRepository.removeTask(index);
                      } else if (result != null) {
                        await tasksRepository.updateTaskAtIndex(index, result);
                      }
                      setState(() {});
                    },
                  );
                },
              );
            } else if (snapshot.data == null)
              return Container(
                child: Text("No tasks"),
              );

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewTask()));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
