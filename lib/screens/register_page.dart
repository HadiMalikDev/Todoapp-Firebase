import 'package:flutter/material.dart';
import 'package:todolist/network/auth.dart';
import 'package:todolist/screens/tasks_page.dart';

import '../keys.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key key}) : super(key: key);

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Form(
            key: Keys.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null)
                      return 'Please enter email address';
                    else
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
                    if (val == null)
                      return 'Please enter password';
                    else
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
                      Authentication authentication = Authentication();
                      await authentication.signUp(
                          email: email, password: password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TasksPage()));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "* The password must be greater than 6 characters long",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
