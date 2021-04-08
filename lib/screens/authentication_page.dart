import 'package:flutter/material.dart';
import 'package:todolist/screens/login_page.dart';
import 'package:todolist/screens/register_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            Container(
              child: Text(
                "TODO LIST",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 25),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(
                    Size(size.width * .4, size.height * 0.07)),
              ),
            ),
            SizedBox(
              height: size.height*0.025,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 25),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(
                    Size(size.width * .4, size.height * 0.07)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
