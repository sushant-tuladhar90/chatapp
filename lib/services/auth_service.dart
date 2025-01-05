import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  // Instance of FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Instance of FirebaseFirestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Sign in user
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Sign in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optionally update user's document if needed
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up new user
  Future<UserCredential> signUpWithEmailAndPassword(
      String username, String email, String password) async {
    try {
      // Create user
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create a new document in the 'users' collection
      _fireStore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'username': username, // Add username field
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign out user
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
