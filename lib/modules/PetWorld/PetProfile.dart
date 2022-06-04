
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Providers/UserProvider.dart';
import '../../Services/ContactService.dart';
import '../../Services/DataBase.dart';


class PetProfile extends StatelessWidget {
  late var doc;
  PetProfile( {
    required this.doc});

  List<String> dieses = ['A', 'b', 'c'];
fun (context) async {
 // await Provider.of<UserProvider>(context,listen: false).GetUserImage(doc['OwnerID']);
  //await Provider.of<UserProvider>(context,listen: false).refreshUser();

}
  @override
  Widget build(BuildContext context) {

       fun(context);
    return Scaffold(
        appBar: null,
        body: Consumer<UserProvider>(

            builder: (context, model, child) {
              model.GetPhoneNumber(UserID: doc.data()['OwnerID']);
              model.GetUserImage(doc.data()['OwnerID']);

              return Stack(
                children: [
                  Positioned.fill(
                    child: Column(children: [
                      Expanded(
                        child: Container(
                            child: Image.network(
                              doc.data()['petImage'],
                              height: 1300,
                              width: 3000,
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
                                          doc.data()['bio']),
                                    ),
                                    SizedBox(
                                      height: 10.0,
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
                            'Name :${doc.data()['name']}',
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
                                    (doc.data()['gender'] == 'female') ? Icons
                                        .female : Icons.male)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Type : ${doc.data()['breed']}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Weight : ${doc.data()['weight'].toString()} kg',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Age : ${doc.data()['Age'].toString()} yo',
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

                              child: Text(
                                'Conntact me:',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 15
                                ),
                              )
                          ),

                          Flexible(
                            child: Row(
                              children: [


                                Expanded(
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                       model.image() ?? ''

                                    ),
                                  ),
                                ),


                                Expanded(
                                  child: Row(
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
                                            phoneNumber: model.phoneNumber()
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
                                        onTap: ()=>ContactService().launchTel(phoneNumber: model.phoneNumber()),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: UIButton(context, "Adopt", () =>
                                      Request(context, doc.data()["OwnerID"],
                                          doc.data()["ID"])),
                                )


                              ],
                            ),
                          ),
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
  Request(context,provider,petId)  async {
    String? uid= await FirebaseRegister().Userinfo().uid;

    DataBase().MakeRequest(petId,uid,provider);
  }


