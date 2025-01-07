import 'package:flutter/material.dart';

class CustomWidget{

  //replace with image,or use favicon package and replace if required...
  static RoundButton({required IconData buttonIcon, required VoidCallback callback,
    Color bgColor = Colors.blue, Color foregroundColor = Colors.white}){
    return InkWell(
      onTap: callback,
      child: CircleAvatar(
        backgroundColor: bgColor,
        foregroundColor: foregroundColor,
        child: Icon(buttonIcon),
      ),
    );
  }
  static RoundIcon({required var num, double radius = 12,
    Color bgColor = Colors.blue, Color foregroundColor = Colors.white}){
    return CircleAvatar(
      radius: radius,
      backgroundColor: bgColor,
      foregroundColor: foregroundColor,
      child: Text("$num")
    );
  }
  //replace with image....
  static ProfileIcon({required var profileIcon, double profileRadius = 20,}){
    return CircleAvatar(
      radius: profileRadius,
      child: Icon(profileIcon)
    );
  }
  static ChatProfileIcon({required var image, double profileRadius = 22,}){
    return CircleAvatar(
        radius: profileRadius,
        child: Image.asset("asset/image.demo_image.png")
    );
  }
  //replace with network image...
  static StoryBanner({required IconData profileIcon, required String username, required VoidCallback callback ,double profileRadius = 20}){
    //use stateful bulder if animation not working or required statefulwidget to work properly.
    return InkWell(
      onTap: callback,
      child: Container(
        width: 80,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white ,borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image..
            CircleAvatar(radius: profileRadius, child: Icon(profileIcon),),
            SizedBox(height: 3,),
            Text("$username", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }

  static PinkBg(){
    return BoxDecoration(
      color: Colors.pink.withValues(alpha: 0.05),
    );
  }
  static ShodowDecoration({Color foregroundColor = Colors.white}){
    return BoxDecoration(
      color: foregroundColor,
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1),
          offset: Offset(0, 1), blurRadius: 4, spreadRadius: 1.1)],
    );
  }
}