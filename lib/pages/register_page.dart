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
   //text controller
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ConfirmpassController = TextEditingController();


  void signup() async{
    if(passController.text != ConfirmpassController.text){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password doesn't match"),
      ),
      );
    }

    //get auth service
    final  authService = Provider.of<AuthService>(context, listen: false);
    try{
      await authService.signUpWithEmailandPassword(emailController.text, passController.text);
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),),),);

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
                const SizedBox(height: 50,),
                //logo 
                const Icon(Icons.message,
                size: 100,
                color: Colors.grey,
                ),       
                const SizedBox(height: 25,),
                //create account message
                const Text("Let's create an accout for you",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF616161),
                  
                ),),
                const SizedBox(height: 50,),
            
            
                //email textfield
                MyTextfield(controller: emailController, hintText: "Email or Phone Number", obscureText: false),
                const SizedBox(height: 10,),

                //password textfield
                MyTextfield(controller: passController, hintText: "Password", obscureText: true),
                const SizedBox(height: 10,),

                //confirm password textfield
                 MyTextfield(controller: ConfirmpassController, hintText: "Confirm Password", obscureText: true),
                const SizedBox(height: 30,),
            
                //sign up button
                MyButton(onTap: signup , text: "Sign Up",),
                const SizedBox(height: 40,),
            
                //no a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?', style: TextStyle(
                      color: Color(0xFF616161),
                    ),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login Now' , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF616161),
                      ),),
                    )
                  ],
                )
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}