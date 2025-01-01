import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide( color: Colors.grey)
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide( color: Colors.white)
        ),
        fillColor: Color(0xFFEEEEEE),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF616161)) 
      ),
    );
  }
}