import 'package:pet_world/models/medical_record.dart';

class pet{
  late String? OwnerID;
  late String? ID;
  late String? name;
  late String? type;
  late String? breed;
  late double? Age;
  late String? gender;
  late double? weight;
  late String? petImage;
 // late medical_record? MadicalRecord;
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
     //this.MadicalRecord,
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
    Age=json['Age'].toDouble()?? 0;
    gender=json['gender']?? '';
    weight=json['weight'].toDouble()?? 0;
  //  MadicalRecord=json['MadicalRecord'] ?? medical_record(vaccinations: [], diseases: [], medicines: []);


  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name ?? '',
      'ID':ID ?? '',
       'OwnerID':OwnerID ?? '',
      'type':type ??'',
      'breed':breed ?? '',
       'description':bio ?? '',
      'Age':Age ?? 0,
      'gender':gender ?? '',
      'weight':weight ?? 0,
     // 'MadicalRecord':MadicalRecord?.toMap(),
      'petImage':petImage ?? '',
      'bio':bio ??''

    };
  }


}