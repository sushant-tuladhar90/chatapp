import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: Center(child: Text("Loading...", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),),
    );
  }

}