import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier {
  //instance of auth
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //sign in user
  Future<UserCredential> signInWithEmailandPassword (String email, String password) async {
    try{
      //sign in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
       return userCredential;
    }
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //create a new user
  Future<UserCredential>signUpWithEmailandPassword(String email, String password) async {
    try{

      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;

    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);

    }
  }

  //sign out user
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }


}