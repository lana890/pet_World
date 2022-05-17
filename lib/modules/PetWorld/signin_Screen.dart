import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/Services/FirebaseRegister.dart';
import 'package:pet_world/colors/colors.dart';
import 'package:pet_world/layout/layout.dart';
import 'package:pet_world/modules/PetWorld/HomeScreenuser.dart';
import 'package:pet_world/modules/PetWorld/WhatAreyou.dart';
import 'package:pet_world/shared/const.dart';
import 'package:pet_world/modules/PetWorld/SignUpScreenPO.dart';
import 'package:provider/provider.dart';

import 'HomeScreenvet.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _passwordTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> Checking() async {
    if (_formKey.currentState!.validate()) {
       await FirebaseRegister().signIn(
         email:_emailTextController.text,
       password:_passwordTextController.text ).then((value) async {
            if(value=='PetOwner'){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => UserAppLayout()));}
            else if(value=='Veterinarian'){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreenvet()));}
            else Fluttertoast.showToast(
                  msg: "${value}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
      }
      );

    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery
                  .of(context)
                  .size
                  .height * 0.2, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    logoWidget("assets/imgs/pets.png"),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Email", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outline, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 5,
                    ),
                    forgetPassword(context),
                    UIButton(context, "Sign In", Checking),
                    signUpOption()
                  ],
                ),

              ),
            ),
          ),
        ),
      );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => WhatAreyou()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 35,
        alignment: Alignment.bottomRight,
        child: TextButton(
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.right,
            ),
            onPressed: () => {}
        )
    );
  }




}


