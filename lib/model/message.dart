import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderUsername; // Updated to use username
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderUsername, // Added senderUsername field
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  // Convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderUsername': senderUsername, // Map senderUsername
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  // Convert from a map
  static Message fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'],
      senderUsername: map['senderUsername'], // Map senderUsername
      receiverId: map['receiverId'],
      message: map['message'],
      timestamp: map['timestamp'],
    );
  }
}
