import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';
import '../../Services/DataBase.dart';

class PetProfile extends StatelessWidget {
  late var doc;
  PetProfile( {
    required this.doc});

  List<String> dieses = ['A', 'b', 'c'];
fun (context) async {
  await Provider.of<UserProvider>(context).GetUserImage(doc['OwnerID']);
}
  @override
  Widget build(BuildContext context) {

       fun(context);
    return Scaffold(
        appBar: null,
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(children: [
                Expanded(
                  child: Container(
                      child: Image.network(
                    doc['petImage'],
                        height: 1300,
                        width: 2000,
                  )
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 100, 8, 300),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text('Discreption:',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            children: [

                              SizedBox(
                                width: 300,
                                child: Text(
                                   doc['bio']),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('Medical Record:',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Row(

                                    children: [
                                  Text('diseases :'),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Container(

                                    child: Row(
                                        children:
                                        dieses
                                            .map((item) => new Text( item+"," ))
                                            .toList()),
                                  )
                                ]),
                              ),



                            ],
                          ),
                        ],
                      ),
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
                  children: [
                    Text(
                      'Name :${doc['name']}',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Row(
                        children: [
                          Text(
                            'Gender : ',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                              (doc['gender'] =='female') ?Icons.female :Icons.male)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Type : ${doc['breed']}',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Weight : ${doc['weight']} kg',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Age : ${doc['Age']} yo',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
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

                        child:Text(
                          'Conntact me:',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 15
                          ),
                        )
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [


                        Expanded(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                             Provider.of<UserProvider>(context).image

                          ),
                        ),
                        ),


                                    Expanded(
                                      child: InkWell(

                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,

                                          radius: 30,
                                          child: ClipOval(
                                            child: Icon(
                                              Icons.chat,
                                              color: Colors.white,
                                            )
                                          ),
                                        ),
                                        onTap: (){},
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(

                                        child: CircleAvatar(
                                          backgroundColor: Colors.lightBlue,
                                          radius: 30,
                                          child: ClipOval(
                                              child: Icon(
                                                  Icons.call,
                                                color: Colors.white,
                                              )
                                          ),
                                        ),
                                        onTap: (){},
                                      ),
                                    ),





                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
