import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // Firebase instances
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send a message
  Future<void> sendMessage(String receiverId, String message, String senderUsername) async {
    // Get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    // Fetch current user's username from Firestore
    final userDoc = await _firestore.collection('users').doc(currentUserId).get();
    final String currentUserUsername = userDoc['username'];

    final Timestamp timestamp = Timestamp.now();

    // Create a new message with the username
    Message newMessage = Message(
      senderId: currentUserId,
      senderUsername: currentUserUsername, // Use username instead of email
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    // Construct chat room ID
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); // Ensure uniqueness by sorting IDs
    String chatRoomId = ids.join("_");

    // Add new message to the database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  // Get messages
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    // Construct chat room ID
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Fetch messages ordered by timestamp
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
