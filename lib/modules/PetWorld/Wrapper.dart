import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_world/modules/PetWorld/HomeScreenuser.dart';
import 'package:pet_world/modules/PetWorld/HomeScreenvet.dart';
import 'package:pet_world/modules/PetWorld/signin_Screen.dart';
import 'package:provider/provider.dart';

import '../../Providers/UserProvider.dart';
import '../../Services/FirebaseRegister.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}


class _WrapperState extends State<Wrapper> {
  late var what;


  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    var user = context
        .watch<UserProvider>()
        .getUser;

    // return either the Home or Authenticate widget
    if (user == null) {
      return SigninScreen();
    } else {
      return HomeScreen();
    }
  }
}