import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/models/medical_record.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../../Services/FirebaseRegister.dart';
import 'PetProfile.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Adopt \n a new pet',
            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 100.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: context.read<UserProvider>().categories.length,
              itemBuilder: (context, index) {
                return Expanded(

                    child: Container(
                      height: 100.0,
                      child: Column(
                        children: [
                          Container(

                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 10 ,right: 10),
                               decoration: BoxDecoration(
                              color: Colors.white,
                                 border: Border.all(color: Colors.transparent),
                               boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(10),


                            ),
                            child: Image.asset(
                              UserProvider().categories[index]['iconPath'],
                              height: 50,
                              width: 50,
                                color: Colors.grey[700]
                            ),
                          ),
                          Text(UserProvider().categories[index]['name'])
                        ],
                      ),
                    ),


                );
              },
            ),
          ),

        Expanded(
         child: ListView.builder(
           shrinkWrap: true,
             itemCount: 4,
             itemBuilder: (context, index) {
               return
                 InkWell(
                   child: Container(

                     height: 240,
           padding: EdgeInsets.only(bottom: 10),
                     margin: EdgeInsets.symmetric(horizontal: 20),
                     child: Row(
                       children: [
                         Expanded(
                           child: Stack(
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     image: AssetImage(
                                         'assets/imgs/real cat.jpg'),
                                     fit: BoxFit.fill,
                                   ),
                                   color: Colors.grey,
                                   borderRadius: BorderRadius.circular(20),
                                   boxShadow: shadowList,
                                 ),
                                 margin: EdgeInsets.only(top: 50),
                               ),

                             ],
                           ),
                         ),
                         Expanded(
                             child: Container(
                               margin: EdgeInsets.only(top: 60, bottom: 20),
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   boxShadow: shadowList,
                                   borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(20),
                                       bottomRight: Radius.circular(20))),
                               child: Container(
                                 padding: const EdgeInsets.all(20),
                                 child: Column(
                                   children: [
                                     Row(
                                       children: [
                                         Text(
                                           'lolo',
                                           style: TextStyle(
                                             color: Colors.black54,
                                             fontSize: 20.0,
                                             fontWeight: FontWeight.bold
                                           ),
                                         ),
                                         SizedBox(
                                           width: 50.0,
                                         ),

                                         Expanded(
                                           child: Icon(
                                               Icons.female,
                                             size: 50.0,
                                             color: Colors.black12,
                                           ),
                                         )
                                       ],
                                     ),
                                     SizedBox(
                                       height: 10.0,
                                     ),
                                     Text(
                                       'sherazi cat',
               style: TextStyle(
               color: Colors.black54,
               fontSize: 20.0,
               fontWeight: FontWeight.bold
               ),
                                     ),
                                     SizedBox(
                                     height: 10.0,
                                     ),
                                     Expanded(
                                       child: Text(
                                         '1.5 kg',
                                         style: TextStyle(
                                             color: Colors.black54,
                                             fontSize: 10.0,
                                             fontWeight: FontWeight.bold
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ))
                       ],
                     ),
                   ),
                   onTap: (){
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => PetProfile()));
                   },
                 );

             }),
       ),

      ]
    ),









      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  String? onTap() {
    User? user = FirebaseRegister().Userinfo() as User;
    medical_record m =
        medical_record(vaccinations: [], diseases: [], medicines: []);
    FirebaseRegister()
        .addPetToPO(
            userID: user.uid,
            name: 'lkl',
            weight: '98',
            Age: '89',
            gender: 'female',
            type: 'gh',
            breed: 'jk',
            MadicalRecord: m)
        .then((value) => print('done'));
  }
}
