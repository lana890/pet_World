
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/modules/PetWorld/AddNewPet.dart';
import 'package:pet_world/modules/PetWorld/ChooseFromMyPets.dart';
import 'package:pet_world/modules/PetWorld/MyPetsList.dart';

class ChoosePet extends StatelessWidget {
  const ChoosePet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(


          children: [
            Container(
        margin: EdgeInsets.only(top: 40),
          child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
          ),
        ),
            SizedBox(
              height: 200.0,
            ),
            Text('Add Pet For Adoption:',
            style: TextStyle(
              fontWeight: FontWeight.bold
            )),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                  onTap: (){
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => ChooseFromMyPets()));


      },
        child: Container(
            padding: const EdgeInsets.all(10),

            width: 140,
          height: 190,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),

                    gradient: LinearGradient(colors: [
                        hexStringToColor("CB2B93"),
                    hexStringToColor("9546C4"),
                    hexStringToColor("5E61F4")
              ]
          ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/imgs/my pet.jpg",
                    width: 70.0,height: 70.0,
                    color: Colors.white),
              SizedBox(height: 5,),
              Text(
                  "My Pets",
                  style: TextStyle(color: Colors.white,
                      fontSize: 15,fontWeight: FontWeight.bold),
              ),
              ],
            )

        ),
      ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child:GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddNewPet()));


                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),

                      width: 140,
                      height: 190,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20)),

                          gradient: LinearGradient(colors: [
                            hexStringToColor("CB2B93"),
                            hexStringToColor("9546C4"),
                            hexStringToColor("5E61F4")
                          ]
                      ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/imgs/new pet.jpg",
                              width: 70.0,height: 70.0,
                              color: Colors.white),
                          SizedBox(height: 5,),
                          Text(
                            "Add New Pet",
                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                        ],
                      )

                  ),
                )
                )
],
          )
          ]
      )
    )
    );
  }
}
