import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_world/models/pet.dart';

class pet_owner {
  late String? name;
  late String? email;
  late String ?phone;
  late String? uid;
  late String? image;
 // late List<pet>? mypets;
  late String? latidude;
  late String? longitude;


  pet_owner({

    this.name,
    this.email,
    this.phone,
    this.uid,
   // this.mypets,
    this.image,
    this.latidude,
    this.longitude,

  });

  pet_owner.fromJson(Map<String, dynamic>json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    //mypets=json['mypets'];
    image = json['image'];
    latidude = json['latidude'];
    longitude = json['longitud'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
     // 'mypets': mypets,
      'image': image,
      'latidude': latidude,
      'longitud': longitude,


    };
  }

}