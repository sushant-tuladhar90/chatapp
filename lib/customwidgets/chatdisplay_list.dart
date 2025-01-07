import 'package:chatapp/customwidgets/customwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDisplayList extends StatelessWidget{
  var chatsData = [
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Design team",
      "message" : "Awesome",
      "newMsg" : "1"
    },
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Daily planning",
      "message" : "Ok",
      "newMsg" : "4"
    },
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Marvin McKinney",
      "message" : "Sounds goods",
       "newMsg" : "0"
    },
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Design team",
      "message" : "Awesome",
       "newMsg" : "0"
    },
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Daily planning",
      "message" : "Ok",
       "newMsg" : "0"
    },
    {
      "ProfileImage" : "asset/image/demo_image.png",
      "Name" : "Marvin McKinney",
      "message" : "Sounds goods",
      "newMsg" : "3"
    },
  ];
 // pictures is not working yet.

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          var profileImage = chatsData[index]["ProfileImage"];
          var name = chatsData[index]["Name"].toString();
          var message = chatsData[index]["message"].toString();
          var nummsg = chatsData[index]["newMsg"].toString();
          bool haveMsg = (chatsData[index]["newMsg"].toString() != "0")? true : false;
        return ListTile(
          onTap: (){},
          leading:  CircleAvatar(radius: 22,child: Text("$index"),), //{chatsData[index]["ProfileImage"]}
          title: Text("$name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          subtitle: Text("$message"),
          trailing: (haveMsg)? CustomWidget.RoundIcon(num: nummsg) : Text(""),
        );
    },itemCount: chatsData.length,
      separatorBuilder: (context, index){return Divider(thickness: 0.2, height: 15,);},);
  }

}