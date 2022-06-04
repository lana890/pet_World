


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_world/Providers/UserProvider.dart';
import 'package:pet_world/models/pet.dart';
import 'package:pet_world/models/pet_owner.dart';
import 'package:pet_world/models/veterinarian.dart';
import 'package:pet_world/shared/const.dart';
import 'package:provider/provider.dart';

import '../models/RequestModel.dart';
import '../models/appointment.dart';
import 'FirebaseRegister.dart';

class DataBase {

  String? uuid = "";

  DataBase({
    this.uuid
  } );


  late FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>? get readPets =>
      _firestore.collection("Adoption")
          .doc("lGOe277S95rB7zHGW80Z")
          .collection("pet")
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>>? get mypets =>

    _firestore.collection("PetOwner")
        .doc(uuid)
        .collection("pets")
        .snapshots();


  Future? MakeRequest(PetID, MyID, ProviderID) {
    RequestModel rq = RequestModel(
        PetID: PetID, ProviderID: ProviderID, UserID: MyID);
    _firestore.collection("Requests").add(rq.toMap()).then((value) async =>
    await _firestore.collection("Requests").doc(value.id).update(
        {'ReqID': value.id}));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? get req =>


      _firestore.collection('Requests')
          .where('ProviderID', isEqualTo: uuid)
          .snapshots(); //.where('ProviderID', isEqualTo: "lCiYCZJHECYnriTKbBYlVVxpHm92")
  //.get();

  Future<void> addNewPetToAdoptionFromPO({


    required name,
    required weight,
    required Age,
    required gender,
    required type,
    required breed,
    required image,
    required bio
    //  required MadicalRecord

  }) async {
    pet pets = pet(
        OwnerID: FirebaseRegister()
            .Userinfo()
            .uid,
        name: name,
        weight: weight,
        Age: Age,
        gender: gender,
        type: type,
        breed: breed,
        petImage: image,
        bio: bio


    );
    await _firestore.collection('Adoption').doc("lGOe277S95rB7zHGW80Z")
        .collection('pet').add(pets.toMap())
        .then((value) async =>
    await _firestore.collection('Adoption').doc("lGOe277S95rB7zHGW80Z")
        .collection('pet').doc(value.id)
        .update({'ID': value.id}));
  }

  RejectRequest({
    required RequestID
  }) async {
    await _firestore.collection("Requests").doc(RequestID).delete();
  }


  TransferPetFromMyOwnPetToUSER({
    required petID,
    required RequsterID,
    required me,

  }) async {

    var pet1 = await _firestore.collection('PetOwner').doc(me).collection(
        'pets').doc(petID).get();
    var pet2 = await _firestore.collection('Veterinarian').doc(me).collection(
        'pets').doc(petID).get();
    if (pet1.exists) {
      pet pp = pet.fromJson(pet1.data()!);
      var PO = await _firestore.collection('PetOwner').doc(RequsterID).get();
      var VET = await _firestore.collection('Veterinarian')
          .doc(RequsterID)
          .get();
      if (PO.exists)
        await _firestore.collection('PetOwner').doc(RequsterID)
            .collection("pets")
            .add(pp.toMap());
      else if (VET.exists)
        await _firestore.collection('Veterinarian').doc(RequsterID).collection(
            "pets").add(pp.toMap());
    }
    else if (pet2.exists) {
      pet pp = pet.fromJson(pet1.data()!);
      var PO = await _firestore.collection('PetOwner').doc(RequsterID).get();
      var VET = await _firestore.collection('Veterinarian')
          .doc(RequsterID)
          .get();
      if (PO.exists)
        await _firestore.collection('PetOwner').doc(RequsterID)
            .collection("pets")
            .add(pp.toMap());
      else if (VET.exists)
        await _firestore.collection('Veterinarian').doc(RequsterID).collection(
            "pets").add(pp.toMap());
    }
  }


  transferPet({
    required petID,
    required RequsterID,
    required reqID

  }) async {
    var pet1 = await _firestore.collection('Adoption').doc(
        "lGOe277S95rB7zHGW80Z").collection('pet').doc(petID).get();


    pet pp = pet.fromJson(pet1.data()!);
    pp.OwnerID=RequsterID;
    var PO = await _firestore.collection('PetOwner').doc(RequsterID).get();
    var VET = await _firestore.collection('Veterinarian').doc(RequsterID).get();


    if (PO.exists)
      await _firestore.collection('PetOwner').doc(RequsterID)
          .collection("pets").doc(pp.ID)
          .set(pp.toMap());
    else if (VET.exists)
      await _firestore.collection('Veterinarian').doc(RequsterID)
          .collection("pets").doc(pp.ID)
          .set(pp.toMap());

    await _firestore.collection('Requests').doc(reqID).delete();
    await _firestore.collection('Adoption').doc("lGOe277S95rB7zHGW80Z").collection(petID).doc(petID).delete();
  }


  Future<bool?>? checkTypeOfUser() async {
    var po = await _firestore.collection('PetOwner').doc(uuid).get();
    var ve = await _firestore.collection('Veterinarian').doc(uuid).get();
    if (po.exists) {
      return true;
    }
    else if (ve.exists) {
      return false;
    }
  }

  Future TransferMYPetToAdoption({
  required MYID,
    required PETID,
    required Des
}) async {
    var PO = await _firestore.collection('PetOwner').doc(MYID).collection("pets").doc(PETID).get();
    pet pp=pet.fromJson(PO.data()!);
    pp.bio=Des;

    _firestore.collection('Adoption').doc("lGOe277S95rB7zHGW80Z").collection("pet").doc(pp.ID).set(pp.toMap());
    _firestore.collection('PetOwner').doc(MYID).collection("pets").doc(PETID).delete();
    //_firestore.collection('Adoption').doc(MYID).collection("lGOe277S95rB7zHGW80Z").doc(PETID).delete();


  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? get readVets =>
      _firestore.collection("Veterinarian")
          .snapshots();




  Future Booking({
  required petID,
    required VetID,
    required petownerID,
    required day,
    required time
}) async {
    appointment ap=appointment( PetID: petID,Day: day,DoctorID: VetID,PetOwnerID:petownerID,Time: time );
    await _firestore.collection("Appointments").add(ap.toMap()).then((value) async =>
    await _firestore.collection('Appointments').doc(value.id)

        .update({'appoID': value.id})
    );
}


  Stream<QuerySnapshot<Map<String, dynamic>>>? get readAppointments =>
      _firestore.collection("Appointments").where("DoctorID",isEqualTo: uuid)
          .snapshots();


  Stream<QuerySnapshot<Map<String, dynamic>>>? get readAppointmentsUSER =>
      _firestore.collection("Appointments").where("PetOwnerID",isEqualTo: uuid)
          .snapshots();

 DeleteAppointment(appuid) async {
  await _firestore.collection("Appointments").doc(appuid).delete();

}
}

  








