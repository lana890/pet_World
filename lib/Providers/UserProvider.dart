import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_world/modules/PetWorld/Adoption_Screen.dart';
import 'package:pet_world/modules/PetWorld/GetToKnow_Screen.dart';
import 'package:pet_world/modules/PetWorld/PetCare_Screen.dart';
import 'package:pet_world/modules/PetWorld/chat.dart';
import 'package:pet_world/modules/PetWorld/userAppointmets_Screen.dart';

class UserProvider extends ChangeNotifier{
  late bool _isVet;
  String _loc="";
  int _currentIndex=0;
  List<Widget> _screens=[AdoptionScreen(),GetToKnow(),chat(),UserAppointment(),PetCare()];
  List<Map> categories = [
    {'name': 'Cats', 'iconPath': 'assets/imgs/cat.webp'},
    {'name': 'Dogs', 'iconPath': 'assets/imgs/dog.png'},
    {'name': 'Bunnies', 'iconPath': 'assets/imgs/bun.png'},
    {'name': 'hamsters', 'iconPath': 'assets/imgs/hamss.png'},
    {'name': 'others', 'iconPath': 'assets/imgs/others.png'},

  ];
   int _CurrentCatagoryIdnex=0;

   int get currentCatagoryIndex=>_CurrentCatagoryIdnex;
   set currentCatagoryIndex(int index){
     _CurrentCatagoryIdnex=index;
     notifyListeners();
   }


   get currentIndex=>_currentIndex;
   get currentScreen=>_screens[_currentIndex];

  void setIsVet(bool value){
    _isVet=value;
    notifyListeners();
  }
  bool? get isvet=>_isVet;

  void setLoc(String value){
    _loc=value;
    notifyListeners();
  }
  String get loc=>_loc;
   late User _user;
  final  _authMethods =  FirebaseAuth.instance;

  User? get getUser => _user;

  Future<void> refreshUser() async {
    User? user = await _authMethods.currentUser!;
    _user = user;

    notifyListeners();
  }

  set setCurrentIndex(int index){
    _currentIndex=index;
    notifyListeners();
  }
}

