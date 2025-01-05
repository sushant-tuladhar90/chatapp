import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text controllers
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Sign-in method
  Future<void> signin() async {
    // Get AuthService instance
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text, // Email
        passController.text,  // Password
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Logo
                const Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.grey,
                ),
                const SizedBox(height: 25),
                // Welcome message
                const Text(
                  "Welcome back, you've been missed!!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF616161),
                  ),
                ),
                const SizedBox(height: 50),

                // Email text field
                MyTextfield(
                  controller: emailController,
                  hintText: "Email or Phone Number",
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // Password text field
                MyTextfield(
                  controller: passController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // Sign-in button
                MyButton(
                  onTap: signin,
                  text: "Login",
                ),
                const SizedBox(height: 40),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF616161),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
