import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class VetLayout extends StatelessWidget {
  const VetLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, model, child) =>
          Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,


                actions: [

                  IconButton(
                    color: Colors.grey,
                    icon: Icon(
                      Icons.notifications,),
                    onPressed: () {},

                  ),

                  IconButton(
                    color: Colors.grey,
                    icon: Icon(
                        Icons.menu),
                    onPressed: () {},

                  ),


                ],
              ),


              body: model.currentVetScreen,
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: model.currentVetIndex,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (int value) {
                  model.setCurrentvetIndex = value;
                },
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: Icon(Icons.pets),
                    title: Text('Adoption'),
                    activeColor: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.add),
                    title: Text('Requests'),
                    activeColor: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.calendar_today_rounded),
                    title: Text('Appointments'),
                    activeColor: Colors.grey,
                    textAlign: TextAlign.center,
                  ),


                ],

              )
          ),
    );
  }


}

