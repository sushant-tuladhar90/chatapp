import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customwidget.dart';

class TopAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: CustomWidget.PinkBg(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //to space...
          //appbar contaion...
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side...
              Row(
                children: [
                  //image....
                  const SizedBox(width: 16,),
                  CustomWidget.ProfileIcon(profileIcon: Icons.person, profileRadius: 25),
                  const SizedBox(width: 10,),
                  //texts....
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello...", style: TextStyle(color: Colors.black.withValues(alpha: 0.7), fontSize: 12),),
                        const SizedBox(height: 2,),
                        Text("Alex bender", style: TextStyle(color: Colors.black, fontSize: 22),),
                      ],
                    ),
                  )
                ],
              ),
              //right side,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomWidget.RoundButton(buttonIcon: Icons.search_rounded, bgColor: Colors.pink, callback: (){
                    //search somethings on press...
                  }),
                  const SizedBox(width: 6,),
                  CustomWidget.RoundButton(buttonIcon: Icons.add, callback: (){
                    //do somethings on add.
                  }),
                  const SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

}