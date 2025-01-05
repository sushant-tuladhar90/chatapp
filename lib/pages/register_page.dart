import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();

  // Sign-up method
  void signup() async {
    if (passController.text != confirmpassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
        ),
      );
      return;
    }

    // Get AuthService instance
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
        usernameController.text, // Username
        emailController.text,    // Email
        passController.text,     // Password
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully!"),
        ),
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
                // Create account message
                const Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF616161),
                  ),
                ),
                const SizedBox(height: 50),

                // Username text field
                MyTextfield(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 10),

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
                const SizedBox(height: 10),

                // Confirm password text field
                MyTextfield(
                  controller: confirmpassController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // Sign-up button
                MyButton(
                  onTap: signup,
                  text: "Sign Up",
                ),
                const SizedBox(height: 40),

                // Already a member? Login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(
                        color: Color(0xFF616161),
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
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
