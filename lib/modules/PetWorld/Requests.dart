import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/models/User.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../../Services/ContactService.dart';
import '../../Services/DataBase.dart';

class Requests extends StatelessWidget {
late String uuid="";
  GetUserImage(context, ID) async {
    await Provider.of<UserProvider>(context).GetUserImage(ID);
  }
  GetPetImage(context, ID) async {
    await Provider.of<UserProvider>(context).GetPetImage(ID);
  }

GetUser(context)async{

  Provider.of<UserProvider>(context,listen: false).refreshUser().then((value) async {
    uuid = (await Provider
        .of<UserProvider>(context, listen: false)
        .getUser()
        ?.uid)!;
  });
  }


  @override
  Widget build(BuildContext context) {
    GetUser(context);

    return Consumer<UserProvider>(
      builder: (context, model, child) {
        return StreamBuilder<QuerySnapshot?>(

            stream: DataBase(uuid: uuid).req,
            builder: (BuildContext context,
                AsyncSnapshot<dynamic>snapshot) {

              if (snapshot.hasData) {
                return Scaffold(

                  appBar: null,

                  body: ListView.separated(


                      separatorBuilder: (context, index) =>
                          SizedBox(

                            height: 5.0,

                          ),

                      itemCount: snapshot.data!.docs.length,


                      itemBuilder: (context, index) {
                        GetUserImage(
                            context, snapshot.data!.docs[index]['UserID']);

                        GetPetImage(
                            context, snapshot.data!.docs[index]['PetID']);
                            model.GetPhoneNumber(UserID:  snapshot.data!.docs[index]['UserID']);

                        return Slidable(

                          startActionPane: ActionPane(

                            motion: StretchMotion(),

                            children: [

                              SlidableAction(

                                onPressed: ((context) => {
                                  DataBase().transferPet(petID: snapshot.data!.docs[index]['PetID'],
                                      RequsterID: snapshot.data!.docs[index]['UserID'],
                                    reqID: snapshot.data!.docs[index]['ReqID']
                                  )
                                }),

                                icon: Icons.library_add_check_rounded,

                                backgroundColor: Colors.green,

                                label: 'Accept',

                              ),

                              SlidableAction(

                                onPressed: ((context) => {
                                  ContactService().launchWhatsApp(phoneNumber: model.phoneNumber())
                                }),

                                icon: Icons.whatsapp,

                                backgroundColor: Colors.grey,

                                label: 'Massege',

                              ),


                            ],


                          ),

                          endActionPane: ActionPane(

                              motion: StretchMotion(),

                              children: [

                                SlidableAction(

                                  onPressed: ((context) => {
                                    DataBase().RejectRequest(RequestID: snapshot.data!.docs[index]['ReqID'])
                                  }),

                                  icon: Icons.cancel,

                                  backgroundColor: Colors.red,

                                  label: 'Reject',

                                ),

                              ]

                          ),


                          child: Container(

                            alignment: Alignment.center,


                            width: double.infinity,

                            height: 100,


                            decoration: BoxDecoration(

                                border: Border.all(

                                    color: Colors.purple

                                ),

                                borderRadius: BorderRadius.all(

                                    Radius.circular(20))

                            ),

                            child: Row(

                              children: [

                                Expanded(

                                  child: CircleAvatar(

                                    radius: 30.0,

                                    backgroundImage: NetworkImage(

                                        Provider.of<UserProvider>(context)
                                            .image() ?? ''
                                    ),


                                  ),

                                ),

                                Expanded(

                                  child: Text(

                                      'wants to adopt '

                                  ),

                                ),

                                Expanded(

                                  child: CircleAvatar(

                                    radius: 30.0,

                                    backgroundImage: NetworkImage(

                                        Provider.of<UserProvider>(context)
                                            .Petimage() ?? ''
                                    ),

                                  ),

                                )


                              ],


                            ),


                          ),

                        );
                      }
                  ),
                );
              }


              else if (snapshot.hasError)
                return Text('some Error');

              else
                return
                  Center(
                    child: CircularProgressIndicator(),
                  );
            }
        );
        
      }
    );
  }
}



