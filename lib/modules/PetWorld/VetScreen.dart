import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/Services/ContactService.dart';
import 'package:pet_world/modules/PetWorld/BookScreen.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';
import 'package:pet_world/Services/locationServices.dart';

class VetScreen extends StatelessWidget {
var doc;
VetScreen({
  this.doc
});

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: null,
          body: Consumer<UserProvider>(

              builder: (context, model, child) {

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                children: [
                        Expanded(
                          child: Container(
                              child: Image.network(
                                doc.data()['image'],
                                height: 1300,
                                width: 3000,
                              )
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 100, 0, 300),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Text('Work Times:',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),

                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(

                                          height: 50,

                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(40),
                                            ),
                                          ),

                                          child: Center(
                                            child: Text(
                                                doc.data()['StartDay']
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                        child: Text(
                                            'To'
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(

                                          height: 50,

                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(40),
                                            ),
                                          ),


                                          child: Center(
                                            child: Text(
                                                doc.data()['EndDay']
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                       Expanded(
                                        child: Container(

                                        height: 50,

                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(40),
                                          ),
                                        ),

                                         child: Center(
                                           child: Text(
                                               doc.data()['StartTime']
                                           ),
                                         ),
                                       ),
                                       ),
                                         SizedBox(
                                           width: 20.0,
                                           child: Text(
                                             'To'
                                           ),
                                         ),
                                         Expanded(
                                           child: Container(

                                             height: 50,

                                             decoration: BoxDecoration(
                                               color: Colors.grey[200],
                                               borderRadius: BorderRadius.all(
                Radius.circular(40),
                ),
                                               ),


                                             child: Center(
                                               child: Text(
                                                   doc.data()['EndTime']
                                               ),
                                             ),
                                       ),
                                         )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Center(
                                    child: Text('Contact :',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                InkWell(

                child: CircleAvatar(
                backgroundColor: Colors.green,

                radius: 15,
                child: ClipOval(
                child: Icon(
                Icons.whatsapp,
                color: Colors.white,
                )
                ),
                ),
                onTap:
                ()=> ContactService().launchWhatsApp(
                phoneNumber: doc.data()['phone']
                )

                ),
                SizedBox(
                width: 10.0,
                ),
                InkWell(

                child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 15,
                child: ClipOval(
                child: Icon(
                Icons.call,
                color: Colors.white,
                )
                ),
                ),
                onTap: ()=>ContactService().launchTel(phoneNumber:doc.data()['phone']),
                ),
                                    SizedBox(
                                      width: 10.0,
                                    ),

                                    InkWell(

                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,

                                          radius: 15,
                                          child: ClipOval(
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.blue,
                                              )
                                          ),
                                        ),
                                        onTap:

                                        ()=>locationServices().goToMap(lati: double.parse(doc.data()['latidude']),longi:double.parse(doc.data()['longitud']) )

                                        )



                ]
                ),
                                  SizedBox(
                                    height: 10.0,
                                  ),

















                              ]),
                            ),
                          ),
                        ),
                      ]),
                    ),
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
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 160,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name:${doc.data()['name']}',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child:
                                  Text(
                                     'Experience: ${doc.data()['experience']} years',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold),
                                  ),

                              ),

                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Clinic: ${doc.data()['clinicName']}',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'City : ${doc.data()['city'].toString()} ',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8.0,
                            ),
                            Center(

                                child: UIButton(context, "Book", ()=>Navigator.push(context,
                MaterialPageRoute(builder: (context) =>BookScreen())

                                  ),
                                )
                            )





                          ],
                        ),
                      ),
                    )
                  ],
                );

              })
      );
    }
}