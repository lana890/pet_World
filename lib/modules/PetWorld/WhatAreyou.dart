


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/modules/PetWorld/signin_Screen.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import 'SignUpScreenPO.dart';
import 'SignUpScreenVet.dart';



class WhatAreyou extends StatelessWidget {
  const WhatAreyou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
    hexStringToColor("CB2B93"),
    hexStringToColor("9546C4"),
    hexStringToColor("5E61F4")
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    child: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.fromLTRB(
    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
    child: Container(
      height: 500,
      child: Column(
      children:[
      logoWidget("assets/imgs/pets.png"),
      SizedBox(
      height: 12,
      ),
        Text(
          'What Are you?',
          style: TextStyle(

decorationStyle: TextDecorationStyle.solid,
              color: Colors.white,
            fontSize: 30.0
            ),


          ),
        SizedBox(
  height: 6,
),

        Expanded(
          child: Row(
            children: [

              GestureDetector(
                onTap: (){
                 context.read<UserProvider>().setIsVet(true);
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => SignUpScreenVet()));

                },
                child: Container(
                  height: 190,
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/imgs/vet.png",
                        width: 70.0,height: 70.0,
                      color: Colors.white),
                      SizedBox(height: 5,),
                      Text(
                        "Veterinarians",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),


                  ),
                ),

              SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: (){
                  context.read<UserProvider>().setIsVet(false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreenPO()));


                },
                child: Container(
                  width: 140,
                  height: 190,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/imgs/petOwner.png",
                        width: 70.0,height: 70.0,
                          color: Colors.white),
                      SizedBox(height: 5,),
                      Text(
                        "Pet Owner",
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      ),



                    ],
                  ),



                  ),
                ),




            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have account?",
                style: TextStyle(color: Colors.white70)),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              },
              child: const Text(
                " Sign In",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),

      ]
          ),
    )
    )
    )
    )
    );
  }
}
