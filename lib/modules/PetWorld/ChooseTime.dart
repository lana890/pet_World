import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/modules/PetWorld/Adoption_Screen.dart';

import '../../Services/DataBase.dart';
import '../../shared/const.dart';

class ChooseTime extends StatelessWidget {

  var doc;
var vetID;
  ChooseTime({
    this.doc,
    this.vetID
});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _Day = TextEditingController();
  TextEditingController _Time = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    Future<void> Checking() async {
      if (_formKey.currentState!.validate()) {
        await DataBase().Booking(
          day: _Day.text,
          petID:   doc.data()['ID'] ,
          petownerID:  doc.data()['OwnerID'],
          time: _Time.text,
          VetID:vetID,
        ).then((value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdoptionScreen()));
        });

      }
    }
    return
      Scaffold(

          appBar: null,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
            const SizedBox(
            height: 20,
            ),
    TextFormField(
    validator: (value){
    if(value!.isEmpty) return 'Must be Filled';


    },
    controller: _Day,

    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
    prefixIcon: Icon(
    Icons.calendar_today_rounded,
    color: Colors.grey,
    ),

    labelText: "Choose Day",
    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
    filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: Colors.white.withOpacity(0.3),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
  borderSide: const BorderSide(color: Colors.grey,width: 0, style: BorderStyle.none)),
    ),


    ),
            const SizedBox(
              height: 20,
            ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty) return 'Must be Filled';


                  },
                  controller: _Time,

                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.black.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.grey,
                    ),

                    labelText: "Choose Time",
                    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Colors.grey,width: 0, style: BorderStyle.none)),
                  ),


                ),
            const SizedBox(
              height: 20,
            ),
                UIButton(context, "BOOK", Checking)
        ])


          ))))
    );
  }
}
