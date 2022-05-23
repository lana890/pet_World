
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_world/models/pet.dart';
import 'package:pet_world/models/pet_owner.dart';
import 'package:pet_world/models/veterinarian.dart';

class DataBase{
  late FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>? get readPets =>
    _firestore.collection("Adoption")
        .doc("lGOe277S95rB7zHGW80Z")
        .collection("pet")
        .snapshots();




}







