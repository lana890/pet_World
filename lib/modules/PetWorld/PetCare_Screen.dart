import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/models/veterinarian.dart';
import 'package:pet_world/modules/PetWorld/VetScreen.dart';
import 'package:pet_world/shared/const.dart';

import '../../Services/DataBase.dart';


class PetCare extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:StreamBuilder<QuerySnapshot>(
        stream: DataBase().readVets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(padding: const EdgeInsets.all(5.0),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,)),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) =>
                      InkWell(
                        child: Container(

                          height: 240,
                          padding: EdgeInsets.only(bottom: 10),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot.data!
                                              .docs[index]['image']),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      margin: EdgeInsets.only(top: 30),
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

                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Text(
                                           'Name: ${snapshot.data!.docs[index]['name']}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'City ${snapshot.data!.docs[index]['city']}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            'Clinic ${snapshot.data!.docs[index]['clinicName']}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
          Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 20,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
          child: ElevatedButton(
          onPressed: () {

          },
          child: Text(
          "Read More",
          style: const TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
          return Colors.black26;
          }
          return Colors.white;
          }),
          )
          )
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
                                      VetScreen(doc: snapshot.data!.docs[index])));
                        },
                      ),
                )
            );
          }
          else
           if (snapshot.hasError)
          return Text('some Error');
          else
          return
          Center(
          child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
