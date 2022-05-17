import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_world/models/pet_owner.dart';
import 'package:pet_world/models/veterinarian.dart';
import 'package:pet_world/models/pet.dart';

import 'package:uuid/uuid.dart';


import '../models/User.dart';

class FirebaseRegister {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> SignUpPetOwner({
    required double ?lati,
    required double ?longi,
    required String email,
    required String password,
    required String username,
    required String phoneNumber
  }) async{
     String result='Some Error Accured';
     try {
       await _auth.createUserWithEmailAndPassword
         (email: email, password: password)
           .then((value) async {
             print(value.user!.uid);
         pet_owner PO = pet_owner(
           email: email,
           name: username,
           phone: phoneNumber,
           uid: value.user!.uid,
           mypets: [],
           image: 'https://thumbs.dreamstime.com/b/pet-owner-man-cat-boy-hugging-little-kitten-vector-icon-isolated-white-background-183254575.jpg',
           longitude: lati.toString(),
           latidude: longi.toString(),
           

         );
         await _firestore.collection('PetOwner').doc(value.user!.uid).set(
             PO.toMap());
         result = "success";
       });
     }catch(error){
       result=error.toString();
     }

return result;

  }

  Future<String> SignUpVet({
    required double ?lati,
    required double ?longi,
    required String ClinicName,
    required String email,
    required String password,
    required String username,
    required String phoneNumber,
    required String experience
  }) async{
    String result='Some Error Accured';
    try {
      await _auth.createUserWithEmailAndPassword
        (email: email, password: password)
          .then((value) async {
        print(value.user!.uid);
        veterinarian vet = veterinarian(
          email: email,
          name: username,
          phone: phoneNumber,
          uid: value.user!.uid,
          clinicName: ClinicName,
          experience: experience,
          feedbacks: [],
          pets:[],
          image: 'https://thumbs.dreamstime.com/b/pet-owner-man-cat-boy-hugging-little-kitten-vector-icon-isolated-white-background-183254575.jpg',
          longitude: lati.toString(),
          latidude: longi.toString(),

        );
        await _firestore.collection('Veterinarian').doc(value.user!.uid).set(
            vet.toMap());
        result = "success";
      });
    }catch(error){
      result=error.toString();
    }

    return result;

  }


  Future<String?> signIn( {
    required String email,
    required String password
  }) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var user = result.user;
      var po = await _firestore.collection('PetOwner').doc(user!.uid).get();
      var vet = await _firestore.collection('Veterinarian').doc(user.uid).get();
      if (po.exists)
        return 'PetOwner';
      else if (vet.exists)
        return 'Veterinarian';
    }
    catch (Error) {
      return '${Error.toString()}';
    }

  }

  Future<String?> CheckingUser() async {
    try{
    var uid=await FirebaseAuth.instance.currentUser!.uid;
    var po= await _firestore.collection('PetOwner').doc(uid).get();
    var vet=await _firestore.collection('Veterinarian').doc(uid).get();
    if(po.exists)
      return'PetOwner';
    else if(vet.exists)
      return 'Veterinarian';
    else return 'Null';
  }
  catch(Error){
  return '${Error.toString()}';
  }

}

   Userinfo()
  {
     var user =  FirebaseAuth.instance.currentUser!;
    return user;

  }
  
  Future<void> addPetToPO({
    required userID,

    required name,
    required weight,
    required Age,
    required gender,
    required type,
    required breed,
    required MadicalRecord

})async {
    String petID= const Uuid().v1();
   pet pets=pet(
     OwnerID: Userinfo().uid,
     name: name,
     weight: weight,
     Age: Age,
     gender: gender,
     type: type,
     breed: breed,
       MadicalRecord: MadicalRecord

   );
   await _firestore.collection('PetOwner').doc(userID).collection('pets').add(pets.toMap()).then((value) async =>
   await _firestore.collection('PetOwner').doc(userID).collection('pets').doc(value.id).update({'ID':value.id}))  ;}
}


