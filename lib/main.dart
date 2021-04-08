import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/authentication_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
      /*
      theme: ThemeData(
          backgroundColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.purple,
              centerTitle: true,
              titleTextStyle: TextStyle(fontSize: 30)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff1f033d),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(100, 50)),
              backgroundColor: MaterialStateProperty.all(Color(0xff311a4a)),
            ),
          )),*/
      home: Scaffold(
        body: AuthenticationPage(),
      ),
    ),
  );
}
