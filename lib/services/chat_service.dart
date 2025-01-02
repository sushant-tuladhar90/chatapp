import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier{
  //getting instance of auth AND firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //send msg
  Future<void> sendMessage( String receiverId, String message) async {
    //get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(senderId: currentUserId, senderEmail: currentUserEmail, receiverId: receiverId, message: message, timestamp: timestamp);

    
    
    //construct chat room id from current   user id and receiver id(sorted to ensure uniqueness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //sorting the ids
    String chatRoomId = ids.join("_"); // combine the ids into a single string to use as a chatroomId
    
    
    //add new message to DB     
    await _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').add(newMessage.toMap()); 
  }

  //get msg
  Stream<QuerySnapshot> getMessage (String userId, String otherUserId) {
    //construct chat room id from users ids(sort them)
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId =ids.join("_");

    return _firestore.collection("chat_rooms").doc(chatRoomId).collection('messages').orderBy('timestamp', descending: false).snapshots();
    }

}