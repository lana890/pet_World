
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../Providers/UserProvider.dart';

class UserAppLayout extends StatelessWidget {
  const UserAppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,model,child)=>Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: new Text(
            "PET WORLD",
            style: TextStyle( fontSize: 100.0),
          ),
          actions: [

            IconButton(
              color: Colors.grey,
              icon:Icon(
                  Icons.notifications ,),
              onPressed:(){} ,

            ),

            IconButton(
              color: Colors.grey,
              icon:Icon(
                  Icons.menu),
              onPressed:(){} ,

            ),


          ],
        ),


        body:model.currentScreen ,
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: model.currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (int value) { model.setCurrentIndex=value; },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.pets),
                title: Text('Adoption'),
                activeColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.question_mark),
                title: Text('pets Type'),
                activeColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.chat),
                title: Text('chat'),
                activeColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                title: Text(
                  'Appointments',
                ),
                activeColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.local_hospital),
                title: Text('Vets'),
                activeColor: Colors.grey,
                textAlign: TextAlign.center,
              ),
            ],

          )
      ),
    );
  }

}
