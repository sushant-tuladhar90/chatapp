import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier {
  //instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of the firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //sign in user
  Future<UserCredential> signInWithEmailandPassword (String email, String password) async {
    try{
      //sign in
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
      // add new docs for the user in users collection if it doesn't exists
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,

      });
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

      //after creating the user, create a new docs for the user in theusers colls.
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,

      });


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