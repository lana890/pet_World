

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_world/Services/DataBase.dart';
import 'package:pet_world/layout/layout.dart';
import 'package:pet_world/modules/PetWorld/Adoption_Screen.dart';
import 'package:pet_world/modules/PetWorld/ChooseFromMyPets.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Providers/UserProvider.dart';



class AddNewPet extends StatelessWidget {
  late String uuid = "";

  GetUser(context) async {
    Provider.of<UserProvider>(context, listen: false).refreshUser().then((
        value) async {
      uuid = (await Provider
          .of<UserProvider>(context, listen: false)
          .getUser()
          ?.uid)!;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GetUser(context);
    Uint8List? _file;
    TextEditingController _PetName = TextEditingController();
    TextEditingController _Petbreed = TextEditingController();
    TextEditingController _bio = TextEditingController();



    Future<void> Checking({
      required double? age,
      required double? weight,
      required String? gender,
      required String? type,

      required String? image
    }) async {
      if (_formKey.currentState!.validate()) {
        var retrn = await DataBase().addNewPetToAdoptionFromPO(


            name: _PetName.text,
            weight:weight,
            Age: age,
            gender: gender,
            type: type,
            breed: _Petbreed.text,
            image: image,
            bio: _bio.text)
         .then((value){
          Fluttertoast.showToast(
              msg: "Added successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseFromMyPets()));
        });
            }}
    return Consumer<UserProvider>(

        builder: (context, model, child) {


          return Scaffold(

            body: SingleChildScrollView(

              child: Container(

                decoration: BoxDecoration(
                    color: Colors.grey
                ),

                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 100, 17, 100),


                  child: Form(
                    key: _formKey,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                        children: [
                          Row(
                            children: [
                              Text(
                                  'Pet Name: '
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                fit: FlexFit.loose,
                                  child: reusableTextField(
                                      "Pet Name ",
                                      Icons.drive_file_rename_outline,
                                      false, _PetName)),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                  'Pet Breed: '
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: reusableTextField(
                                      "Pet Breed ", Icons.pets, false,
                                      _Petbreed)),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(

                            child: Text(
                              'AGE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  model.MinusAge();
                                  //print('${CubitCounter.get(context).counter}');
                                },
                                child:
                                Text(
                                    "-", style: TextStyle(fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),

                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60),
                                child: Text(

                                  '${model.Age}',

                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    model.PlusAge();
                                  },


                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),

                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Center(

                            child: Text(
                              'WEIGHT',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  model.MinusWeight();
                                  //print('${CubitCounter.get(context).counter}');
                                },
                                child:
                                Text(
                                    "-", style: TextStyle(fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple)),

                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60),
                                child: Text(
                                  '${model.Wieght}',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    model.PlusWeight();
                                    //print('${CubitCounter.get(context).counter}');
                                  },


                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),

                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Center(

                            child: Text(
                              'Gender',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: GestureDetector(
                                  onTap: () {
                                    model.SetGender(false);
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Image.asset("assets/imgs/male.png",
                                          width: 50.0, height: 50.0,),
                                        SizedBox(height: 15,),
                                        Text(
                                          "Male",
                                          style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: model.Gender
                                          ? Colors.grey[400]
                                          : Colors
                                          .purple,

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Flexible(
                                fit: FlexFit.tight,
                                child: GestureDetector(
                                  onTap: () {
                                    model.SetGender(
                                        true);
                                  },
                                  child: Container(
                                    child: Column(

                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Image.asset("assets/imgs/female.png",
                                          width: 50.0, height: 50.0,),
                                        SizedBox(height: 15,),
                                        Text(
                                          "Female",
                                          style: TextStyle(fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ],
                                    ),
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: model.Gender
                                          ? Colors.purple
                                          : Colors
                                          .grey[400],

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          Center(

                            child: Text(
                              'Type',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          SizedBox(

                            height: 30.0,

                          ),
                          Row(
                            children: [
                              Text(
                                  'Type : '
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 240,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                          borderSide: BorderSide(
                                            color: Colors.purple,
                                            width: 4,
                                          )

                                      )
                                  ),
                                  value: model.SelectedItem,

                                  items: model.getList().map((e) =>
                                      DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(e),
                                      )).toList(),
                                  onChanged: (value) {
                                    model.SelecteItem(value);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(

                            height: 30.0,

                          ),
                          Row(
                              children:[
                                Text(
                                    'description'
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  width: 248,
                                  child: TextField(

                                    minLines: 1,
                                    maxLines: 5,  // allow user to enter 5 line in textfield
                                    keyboardType: TextInputType.multiline,  // user keyboard will have a button to move cursor to next line
                                    controller: _bio,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white.withOpacity(0.9)),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.question_mark,
                                        color: Colors.white70,
                                      ),

                                      labelText:
                                      'BIO',
                                      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                                      filled: true,
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      fillColor: Colors.white.withOpacity(0.3),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                                    ),

                                  ),
                                ),
                              ]
                          ),
                          SizedBox(

                            height: 30.0,

                          ),
                          Center(

                            child: Text(
                              'Upload Pet Picture',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),
                            ),
                          ),



                          SizedBox(

                            height: 30.0,

                          ),

                          Flexible(
                            fit: FlexFit.loose,
                            child: GestureDetector(
                              onTap: () async =>await model.PICKIMAGE(),
                              child: Container(
                                width: 300.0,
                                height: 300.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: Colors.purple
                                    )

                                ),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      if(model.petImageFile !=null) Image.file(model.petImageFile)
                                      else
                                      Image.asset(

                                          'assets/imgs/pets.png'
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 50.0,
                                        color: Colors.blue,
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                          SizedBox(

                            height: 30.0,

                          ),


                          UIButton(context, "Add Pet For Adoption", () async =>Checking(age: model.Age,type: model.SelectedItem
                          ,gender: model.Gender?"female":"male",weight: model.Wieght,image: await model.uplodedimage).then((value) {


                          }))

                        ]
                    ),
                  ),


                ),
              ),
            ),
          );
        }
    );
  }



}


