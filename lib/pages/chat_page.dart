import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUsername;
  final String receiverUserId;
  const ChatPage({super.key, required this.receiverUsername, required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

void sendMessage() async {
  if (_messageController.text.isNotEmpty) {
    User? currentUser = _firebaseAuth.currentUser;

    // Fetch the sender's username safely
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      // Safely fetch the username or use a fallback if it's missing
      String senderUsername = userDoc['username'] ?? 'Unknown User';  // Fallback if 'username' is null

      // Send the message along with the sender's username
      await _chatService.sendMessage(
        widget.receiverUserId,
        _messageController.text,
        senderUsername,  // Pass the sender's username
      );

      // Clear the controller after sending the message
      _messageController.clear();
    } catch (e) {
      print("Error fetching user data: $e");
      // Handle the error (show a message, log the error, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data: $e'))
      );
    }
  }
}



  //     // Clear the controller after sending the message
  //     _messageController.clear();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUsername),
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: _buildMessageList(),
          ),

          // User input
          _buildMessageInput(),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  // Build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessage(
        widget.receiverUserId,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error.toString()}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages yet!'),
          );
        }

        // Render the messages
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  // Build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    // Align the message based on the sender
    bool isCurrentUser = data['senderId'] == _firebaseAuth.currentUser!.uid;
    Alignment alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    // Message bubble style
    Color bubbleColor = isCurrentUser ? Colors.blueAccent : Colors.grey[300]!;
    Color textColor = isCurrentUser ? Colors.white : Colors.black;

    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
  data['senderUsername'] ?? 'Unknown',  // If null, display 'Unknown'
  style: const TextStyle(fontSize: 12, color: Colors.grey),
),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              data['message'],
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        // Text field
        Expanded(
            child: MyTextfield(
          controller: _messageController,
          hintText: 'Enter a message',
          obscureText: false,
        )),

        // Send button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(
            Icons.send,
            size: 40,
          ),
        ),
      ],
    );
  }
}
