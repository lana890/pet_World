import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_world/models/medical_record.dart';
import 'package:pet_world/modules/PetWorld/signin_Screen.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';
import '../../Services/FirebaseRegister.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
fun(context) async{
  context.watch<UserProvider>().refreshUser();
}
  @override
  Widget build(BuildContext context) {
  fun(context);
  String? uid=context.watch<UserProvider>().getUser?.uid;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:UIButton(context, 'click', onTap(uid))
          ),
TextButton(onPressed: () async {
   await FirebaseAuth.instance.signOut;
   Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) =>SigninScreen())); },
child: Text('SignOut'),

)        ],
      ),
    );
  }
  onTap(uid){
  medical_record m=medical_record(vaccinations: [], diseases: [], medicines: []);
  FirebaseRegister().addPetToPO(userID: uid, name: 'lkl', weight: '98', Age: '89', gender: 'female', type: 'gh', breed: 'jk', MadicalRecord:m);
  }
}
