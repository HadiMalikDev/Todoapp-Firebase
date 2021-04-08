import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  //Singleton class Declaration stuff
 // static final Authentication _authentication = Authentication._();

  //Authentication._();

//  factory Authentication() => _authentication;

  FirebaseAuth auth = FirebaseAuth.instance;

  UserCredential credential;
  User user;

  Future<String> login({String email, String password}) async {
    try {
      credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user=credential.user;
      return "";
    } catch (e) {
      return e.code.toString();
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user=credential.user;
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'tasks':[
          {
            'title':"demo title",
            'description':"demo description"
          }
        ]
      });
      return "";
    } catch (e) {
      return e.code.toString();
    }
  }
  
}
