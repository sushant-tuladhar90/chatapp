import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage({super.key, required this.receiverUserEmail, required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _messageController = TextEditingController(); 
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage () async{
    //send only if there is the message
    if (_messageController.text.isNotEmpty){
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);
      //clear the controller after sending the msg
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          //messages
          Expanded(child: _buildMessageList(),
          ),

          //user input
          _buildMessageInput();
        ],
      ),
    );
  }


//build message list



//build msg item


//build msg input
Widget _buildMessageInput () {
  return Row(
    children: [
      //text fields
      Expanded(child: MyTextfield(
        controller: _messageController, 
        hintText: 'Enter a message', 
        obscureText: false)),

        //send button
        IconButton(onPressed: sendMessage, 
        icon: const Icon(
          Icons.send,
          size: 40,))
    ],
  );
}
}