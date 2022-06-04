import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Services/DataBase.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/modules/PetWorld/ChooseTime.dart';

class BookScreen extends StatelessWidget {
  fun()async{
    uuid=FirebaseRegister().Userinfo().uid;



  }
  var uuid;
  @override
  Widget build(BuildContext context) {return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:Text('My Pets for adoption',style: TextStyle(color: Colors.black),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,

      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: DataBase(uuid: uuid).mypets,

          builder: (BuildContext context,
              AsyncSnapshot<dynamic>snapshot) {
            if (snapshot.hasData) {

              return ListView.separated(
                  separatorBuilder:(BuildContext context, int index)=> const Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20.0,)
                  ),
                  itemBuilder:( BuildContext context, int index)=>ChooseTime(doc: snapshot.data.docs[index]),
                  itemCount: snapshot.data.docs.length);
            }  else if (snapshot.hasError)
              return Text('some Error');
            else
              return
                Center(
                  child: CircularProgressIndicator(),
                );

          }

      )
  );
  }
}