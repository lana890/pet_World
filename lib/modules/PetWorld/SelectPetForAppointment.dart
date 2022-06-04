import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/modules/PetWorld/AddMYPetForAdoption.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import 'ChooseTime.dart';
class SelectPetForAppointment extends StatelessWidget {


var doc;
var vetID;
SelectPetForAppointment({
  required this.doc,
  required this.vetID
});

@override
Widget build(BuildContext context) {
  return  Consumer<UserProvider>(
      builder: (context, model, child) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>ChooseTime(doc: doc,vetID: vetID,)));
          },
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0)),
                            boxShadow: shadowList,
                            image: DecorationImage(
                              image: NetworkImage(
                                  doc.data()['petImage']
                              ),
                              fit: BoxFit.cover,

                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name :${doc.data()['name']}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                      children: [
                                        Text('Gender:',
                                            style: TextStyle(fontSize: 18.0,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(width: 10.0,),
                                        Icon(
                                            (doc.data()['gender'] == 'female')
                                                ? Icons
                                                .female
                                                : Icons.male)
                                      ]),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                      children: [
                                        Text('Age:  ${doc.data()['Age']
                                            .toString()} yo',
                                            style: TextStyle(fontSize: 18.0,
                                                fontWeight: FontWeight.w800)),

                                      ]),
                                ])
                        )
                      ])
              )
          ),
        );

      });
}

}
