import 'package:pet_world/models/medical_record.dart';

class pet{
  late String? OwnerID;
  late String? ID;
  late String? name;
  late String? type;
  late String? breed;
  late String? Age;
  late String? gender;
  late String? weight;
  late String? petImage;
  late medical_record? MadicalRecord;
  late String? bio;

  pet({
       this.petImage,
      this.OwnerID,
     this.name,
     this.weight,
     this.Age,
     this.gender,
     this.type,
     this.breed,
     this.MadicalRecord,
    this.bio

 });

  pet.fromJson(Map<String, dynamic>json)
  {  OwnerID=json['OwnerID']?? '';
    petImage=json['petImage']?? '';
    ID=json['ID']?? '';
    name=json['name']?? '';
    type=json['type']?? '';
    breed=json['breed']?? '';
    bio=json['bio']?? '';
    Age=json['Age']?? '';
    gender=json['gender']?? '';
    weight=json['weight']?? '';
    MadicalRecord=json['MadicalRecord'] ?? medical_record(vaccinations: [], diseases: [], medicines: []);


  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name ?? '',
       'OwnerID':OwnerID ?? '',
      'type':type ??'',
      'breed':breed ?? '',
       'description':bio ?? '',
      'Age':Age ?? '',
      'gender':gender ?? '',
      'weight':weight ?? '',
      'MadicalRecord':MadicalRecord?.toMap(),
      'petImage':petImage ?? ''

    };
  }


}