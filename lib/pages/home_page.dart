import 'package:chatapp/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Instance of the auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign out
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _buildUserList(),
    );
  }

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error loading users',
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: Colors.grey,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final doc = snapshot.data!.docs[index];
            return _buildUserListItem(doc);
          },
        );
      },
    );
  }

  // Build individual user list item
Widget _buildUserListItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

  // Ensure we're not showing the current user
  if (_auth.currentUser!.uid != data['uid']) {
    // Use a fallback if the username is null or missing
    String username = data['username'] ?? 'Unknown User';  // Default to 'Unknown User' if username is null

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text(
          username.isNotEmpty ? username[0].toUpperCase() : '?', // Show the first letter of the username or '?' if username is empty
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        username,  // Show the username or fallback value
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverUsername: username,
              receiverUserId: data['uid'],
            ),
          ),
        );
      },
    );
  } else {
    return const SizedBox.shrink();  // Don't show the current user in the list
  }
}


}
