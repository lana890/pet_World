import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/Services/DataBase.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

class UserAppointment extends StatelessWidget {

  var uuid;
  fun()async{
    uuid=FirebaseRegister().Userinfo().uid;



  }
  @override
  Widget build(BuildContext context) {
    fun();


    return Scaffold(

        body: Column(
            children: [
              Consumer<UserProvider>(
                  builder: (context, model, child) {

                    return StreamBuilder<QuerySnapshot>(
                        stream: DataBase(uuid: uuid).readAppointmentsUSER,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return
                              Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        return

                                          Container(
                                              child: Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Column(children: [
                                                    Row(children: [
                                                      Container(
                                                        width: 120.0,
                                                        height: 130.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(20.0)),
                                                          boxShadow: shadowList,
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                                'https://media.istockphoto.com/photos/young-woman-with-dog-picture-id1060529042?k=20&m=1060529042&s=612x612&w=0&h=Aufce7ZQETWvxwUgcB_09Crtd7LkhR1348C6LD8VG2c='),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 20.0,
                                                      ),
                                                      Expanded(
                                                          child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "",
                                                                  style: TextStyle(
                                                                    fontSize: 20.0,
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow
                                                                      .ellipsis,
                                                                ),
                                                                SizedBox(
                                                                  height: 10.0,
                                                                ),
                                                                Row(children: [
                                                                  Text('Date:',
                                                                      style: TextStyle(
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight
                                                                              .w800)),
                                                                  SizedBox(
                                                                    width: 10.0,
                                                                  ),
                                                                  Text(snapshot.data!.docs[index]['Day'],
                                                                      style: TextStyle(
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight
                                                                              .w500)),
                                                                ]),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(children: [
                                                                  Text('Time:',
                                                                      style: TextStyle(
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight
                                                                              .w800)),
                                                                  SizedBox(
                                                                    width: 15.0,
                                                                  ),
                                                                  Text(snapshot.data!.docs[index]['Time'],
                                                                      style: TextStyle(
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight
                                                                              .w500)),
                                                                ]),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                              ]))
                                                    ]),
                                                    SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Expanded(
                                                              child: MaterialButton(
                                                                onPressed: () =>DataBase().DeleteAppointment(snapshot.data!.docs[index]['appoID']),
                                                                child: Text(
                                                                  'Done',
                                                                  style: TextStyle(
                                                                      fontSize: 16.0,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                color: Colors.purple,
                                                              )),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Expanded(
                                                              child: MaterialButton(
                                                                  onPressed: () =>DataBase().DeleteAppointment(snapshot.data!.docs[index]['appoID']),
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        fontSize: 16.0,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  color: Colors.white60)
                                                          ),
                                                        ]
                                                    )
                                                  ]
                                                  )
                                              )
                                          );
                                      })
                              );
                          }
                          else if (snapshot.hasError)
                            return Text('some Error');
                          else
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                        }

                    );

                  }
              ),
            ])

    );
  }
}

