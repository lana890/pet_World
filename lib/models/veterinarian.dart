class veterinarian{
  late String? name;
  late String? email;
  late String ?phone;
  late String? uid;
  late String? image;
  late String? latidude;
  late String? longitude;
  late List? feedbacks;
late String? experience;
    late String? clinicName;
  late List? pets;

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
    this.feedbacks,
    this.pets,
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
    feedbacks=json['feedbacks'];
    pets=json['pets'];

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
    'feedbacks':feedbacks,
      'pets':pets

    };
  }
}