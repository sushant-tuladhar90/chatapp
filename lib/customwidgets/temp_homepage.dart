import 'package:chatapp/customwidgets/chatdisplay_list.dart';
import 'package:chatapp/customwidgets/customwidget.dart';
import 'package:chatapp/customwidgets/top_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//run this home page to see or test...
class TempHomePage extends StatelessWidget{
  //sample stories data...
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(90), child: TopAppbar()),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: CustomWidget.PinkBg(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //stores sections,
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person, username: "Watch", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle_fill, username: "Thanos", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt, username: "Cohan", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle, username: "Collen", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle_fill, username: "Thanos", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt, username: "Cohan", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle, username: "Collen", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle_fill, username: "Thanos", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt, username: "Cohan", callback: (){}),
                SizedBox(width: 8,),
                CustomWidget.StoryBanner(profileIcon: CupertinoIcons.person_alt_circle, username: "Collen", callback: (){}),
                SizedBox(width: 8,),
              ],),
            ),
            SizedBox(height: 35,),
            
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1),
                      offset: Offset(0, -1), blurRadius: 4, spreadRadius: 1.1)],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Row(children: [SizedBox(width: 20,), Text("Chats", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),],),
                    SizedBox(height: 6,),
                    Expanded(child: ChatDisplayList())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}