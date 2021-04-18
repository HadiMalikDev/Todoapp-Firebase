import 'package:flutter/material.dart';
import 'package:todolist/keys.dart';
import 'package:todolist/network/auth.dart';
import 'package:todolist/screens/tasks_page.dart';
import 'package:todolist/tasks_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;

  String password;

  String error = "";


  Authentication auth = Authentication();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Form(
              key: Keys.key,
              child: Column(
                children: [
                  TextFormField(
                    validator: (val) {
                      if (val == null) return 'Please enter a valid email';
                      email = val;
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter email",
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (val) {
                      if (val == null) return 'Please enter a password';
                      password = val;
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Enter password*",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (Keys.key.currentState.validate()) {
                        error =
                            await auth.login(email: email, password: password);
                        if (error == "") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TasksPage()));
                        } else {
                          setState(() {});
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
