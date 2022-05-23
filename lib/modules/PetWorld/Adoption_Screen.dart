import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/models/medical_record.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../../Services/DataBase.dart';
import '../../Services/FirebaseRegister.dart';
import '../../models/pet.dart';
import 'PetProfile.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {},
          child: Icon(Icons.add),
        ),

        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Adopt \n a new pet',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder:(BuildContext context, int index)=> SizedBox( height: 15.0,),
                  scrollDirection: Axis.horizontal,
                  itemCount: context
                      .read<UserProvider>()
                      .categories
                      .length,
                  itemBuilder: (context, index) {
                    return

                      Container(
                        height: 100.0,
                        child: Column(
                          children: [
                            Container(

                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10),
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



                    );
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: DataBase().readPets,

                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic>snapshot) {
                    if (snapshot.hasData) {

                     // var pet =snapshot.data.docs;
                     return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return
                                InkWell(
                                  child: Container(

                                    height: 240,
                                    padding: EdgeInsets.only(bottom: 10),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [

                                              Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${snapshot.data.docs[index]['petImage']}'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  color: Colors.grey,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                  boxShadow: shadowList,
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: 50),
                                              ),


                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 60, bottom: 20),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: shadowList,
                                                  borderRadius: BorderRadius
                                                      .only(
                                                      topRight: Radius
                                                          .circular(20),
                                                      bottomRight: Radius
                                                          .circular(20))),
                                              child: Container(
                                                padding: const EdgeInsets
                                                    .all(20),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Name : ${snapshot.data.docs[index]['name']}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 15.0,
                                                              fontWeight: FontWeight
                                                                  .bold
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30.0,
                                                        ),

                                                        Flexible(
                                                          child: (
                                                             Icon(
                                                              snapshot.data.docs[index]['gender']=='female'?Icons.female:Icons.male,
                                                              size: 30.0,
                                                              color: Colors
                                                                  .black12,

                                                          )
                                                        ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Text(
                                                      'Type: ${snapshot.data.docs[index]['breed']}',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .black54,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight
                                                              .bold
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Weight: ${snapshot.data.docs[index]['weight']}',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black54,
                                                            fontSize: 15.0,
                                                            fontWeight: FontWeight
                                                                .bold
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
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PetProfile(
                                                    doc: snapshot.data.docs[index])));
                                  },
                                );
                            }),
                      ) ;
                    }
                    else if (snapshot.hasError)
                      return Text('some Error');
                    else
                      return
                        Center(
                          child: CircularProgressIndicator(),
                        );

                  }
              )


            ]
        )

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