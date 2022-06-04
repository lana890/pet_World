
import 'package:pet_world/models/WorkDay.dart';

class veterinarian{
  late String? name;
  late String? email;
  late String ?phone;
  late String? uid;
  late String? image;
  late String? latidude;
  late String? longitude;
late String? experience;
    late String? clinicName;
    late String? city;
    late String? StartDay;
  late String? EndDay;
  late String? StartTime;
  late String? EndTime;




  veterinarian({
    this.name,
    this.email,
    this.phone,
    this.uid,
    this.image,
    this.latidude,
    this.longitude,
    this.clinicName,
    this.experience,
    this.city,
    this.StartDay,
    this.EndDay,
    this.StartTime,
    this.EndTime,


});
  veterinarian.fromJeson( Map<String,dynamic>json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    image = json['image'];
    latidude = json['latidude'];
    longitude = json['longitud'];
    clinicName=json['clinicName'];
   experience=json['experience'];
   city=json['city'];
   StartDay=json['StartDay'];
   EndDay=json['EndDay'];
   StartTime=json['StartTime'];
   EndTime=json['EndTime'];


  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'image': image,
      'latidude': latidude,
      'longitud': longitude,
    'clinicName':clinicName,
    'experience':experience,
      'StartDay':StartDay,
      'EndDay':EndDay,
      'StartTime':StartTime,
      'EndTime':EndTime


    };
  }
}