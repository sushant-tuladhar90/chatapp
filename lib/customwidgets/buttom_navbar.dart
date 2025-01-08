import 'package:chatapp/customwidgets/temp_Discover.dart';
import 'package:chatapp/customwidgets/temp_homepage.dart';
import 'package:chatapp/customwidgets/temp_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomNavbarScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ButtomNavbarScreen_State();
}
class ButtomNavbarScreen_State extends State<ButtomNavbarScreen>{
  int currentPageIndex = 1; // 1 =homepage, 0 = discovery, 2 = settings.
  List<Widget> pages = [
    TempDiscoverPage(),
    TempHomePage(),
    TempSetting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: currentPageIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 7.0,
        currentIndex: currentPageIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black45,
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black45),
          backgroundColor: Colors.white,

          onTap: (index){
            setState(() {
              currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ])
    );
  }

}