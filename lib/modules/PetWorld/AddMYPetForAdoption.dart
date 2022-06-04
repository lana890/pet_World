import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_world/shared/const.dart';

import '../../Services/DataBase.dart';
import 'Adoption_Screen.dart';

class AddMYPetForAdoption extends StatelessWidget {
var doc;
  AddMYPetForAdoption({
    required this.doc
});
TextEditingController _bio = TextEditingController();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar:AppBar(
        iconTheme: IconThemeData(
        color: Colors.black, //change your color here
    ),
    title:Text('My Pets for adoption',style: TextStyle(color: Colors.black),),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    elevation: 0,
        ),
      body:SingleChildScrollView(
        child:Container(
    width: MediaQuery
        .of(context)
        .size
        .width,
    height: MediaQuery
        .of(context)
        .size
        .height,



             child: Form(
              key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [




                Expanded(
                    child: Container(
                    child: Image.network(
                        doc.data()['petImage'],
                     height: 1300,
                     width: double.infinity,
             )

    ),
                  ),







SizedBox(
  height: 20.0,
),

                       Text(
                            'Add Descreption:'
                          ),

                         Expanded(
                        child:TextField(

                          minLines: 1,
                          maxLines: 5,  // allow user to enter 5 line in textfield
                          keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                          controller: _bio,
                          cursorColor: Colors.black,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.9)),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.question_mark,
                              color: Colors.grey,
                            ),
                            labelText:
                            'Description',
                            labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                            filled: true,

                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Colors.black45,width: 0, style: BorderStyle.none)),
                          ),

                                      ),
                         ),

                        UIButton(
                            context, "ADD", ()=>DataBase().
                        TransferMYPetToAdoption(MYID: doc.data()['OwnerID'], PETID: doc.data()['ID'], Des: _bio.text??"").then((value){
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => AdoptionScreen()));
     Fluttertoast.showToast(
    msg: "Added For Adoption",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0
    );}
                        ))
                      ]),
              ),
           ),

    
      )

              );










  }
}
