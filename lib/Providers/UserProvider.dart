import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_world/models/pet.dart';
import 'package:pet_world/models/pet_owner.dart';
import 'package:pet_world/models/veterinarian.dart';
import 'package:pet_world/modules/PetWorld/Adoption_Screen.dart';
import 'package:pet_world/modules/PetWorld/GetToKnow_Screen.dart';
import 'package:pet_world/modules/PetWorld/PetCare_Screen.dart';
import 'package:pet_world/modules/PetWorld/userAppointmets_Screen.dart';

import 'package:pet_world/modules/PetWorld/Requests.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class UserProvider extends ChangeNotifier{
  late FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late bool _isVet;
  late double _Age=0;
  late double _Wieght=0;
  late bool _isFemale=true;

  late String _type="";

  String _loc="";
  int _currentIndex=0;
  List<Widget> _screens=[AdoptionScreen(),GetToKnow(),Requests(),UserAppointment(),PetCare()];
  List<String> items=['Cat','Dog','Hamster','Bunny','Others'];
  String? _SelectedItem="Cat";
  List<Map> categories = [
    {'name': 'Cats', 'iconPath': 'assets/imgs/cat.webp'},
    {'name': 'Dogs', 'iconPath': 'assets/imgs/dog.png'},
    {'name': 'Bunnies', 'iconPath': 'assets/imgs/bun.png'},
    {'name': 'hamsters', 'iconPath': 'assets/imgs/hamss.png'},
    {'name': 'others', 'iconPath': 'assets/imgs/others.png'},

  ];

  List<String> getList(){
    return items;
  }
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
   late User? _user;
  final  _authMethods =  FirebaseAuth.instance;

  User? getUser() { print(_user?.uid); return _user;}


  Future refreshUser() async {
    User? user = await _authMethods.currentUser!;
    _user = user;

    notifyListeners();
  }

  set setCurrentIndex(int index){
    _currentIndex=index;
    notifyListeners();
  }
String ? _image='';
  String? image(){return _image;}

  String ? _Petimage='';
  String? Petimage() {return _Petimage;}

String ? _phoneNumber="";
  String? phoneNumber(){
    return _phoneNumber;
  }
  Future GetUserImage(UserID) async {

      var po = await _firestore.collection('PetOwner').doc(UserID).get();
      var ve = await _firestore.collection('Veterinarian').doc(UserID).get();
      if (po.exists) {
        pet_owner pp = pet_owner.fromJson(po.data()!);
       _image=pp.image;

      }
      else if (ve.exists) {
        veterinarian vv = veterinarian.fromJeson(ve.data()!);
       _image=vv.image;
      }
      notifyListeners();
    }

  Future GetPhoneNumber({
    required UserID}) async {

    var po = await _firestore.collection('PetOwner').doc(UserID).get();
    var ve = await _firestore.collection('Veterinarian').doc(UserID).get();
    if (po.exists) {
      pet_owner pp = pet_owner.fromJson(po.data()!);
      _phoneNumber=pp.phone;

    }
    else if (ve.exists) {
      veterinarian vv = veterinarian.fromJeson(ve.data()!);
      _phoneNumber=vv.phone;
    }
    notifyListeners();
  }


  Future GetPetImage(PetID) async {


      var pett = await _firestore.collection('Adoption').doc("lGOe277S95rB7zHGW80Z").collection("pet").where("ID",isEqualTo: PetID).get();

        pet pp = pet.fromJson(pett.docs.first.data());
        _Petimage=pp.petImage;



  }

  void PlusAge(){
    _Age+=0.5;
    if(_Age>15)
      _Age=0.5;
    notifyListeners();
  }
  void MinusAge(){
    _Age-=0.5;
    if(_Age<0.5)
    _Age=0.5;
    notifyListeners();
  }
  double? get Age=>_Age;

  void PlusWeight(){
    _Wieght+=0.5;
    if(_Wieght>15)
      _Wieght=0.5;
    notifyListeners();
  }
  void MinusWeight(){
    _Wieght-=0.5;
    if(_Wieght<0.5)
      _Wieght=0.5;
    notifyListeners();
  }
   get Wieght=>_Wieght;

  void SetGender(Gender){

     _isFemale=Gender;

    notifyListeners();
  }

  bool get Gender=>_isFemale;

  void SetType(Type){

    _type=Type;

    notifyListeners();
  }

  String get Type=>_type;

  String? get SelectedItem=>_SelectedItem;

  void SelecteItem(value) {

  _SelectedItem=value;
notifyListeners();}

  File? _petImageFile;
  String? _uploadedimage="";

   get uplodedimage=>_uploadedimage;

  get petImageFile=>_petImageFile;
  Future? PICKIMAGE() async {

    var picker = ImagePicker();

     picker.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        _petImageFile = File(value.path);
         uploadProfileImage();

      } else {
        print('No Image Selected');
      }
    });


  }

  void uploadProfileImage()

  async {
    await firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri.file(_petImageFile!.path).pathSegments.last}')
        .putFile(_petImageFile!).then((value) {
      value.ref.getDownloadURL().then((value)  {

         _uploadedimage=value;
         print(_uploadedimage);
         notifyListeners();
      });

    });

  }













}

