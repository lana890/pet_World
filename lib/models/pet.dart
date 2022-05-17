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
  late medical_record? MadicalRecord;

  pet({

      this.OwnerID,
     this.name,
     this.weight,
     this.Age,
     this.gender,
     this.type,
     this.breed,
     this.MadicalRecord,

 });

  pet.fromJson(Map<String, dynamic>json)
  {  OwnerID=json['OwnerID'];
    ID=json['ID'];
    name=json['name'];
    type=json['type'];
    breed=json['breed'];

    Age=json['Age'];
    gender=json['gender'];
    weight=json['weight'];
    MadicalRecord=json['MadicalRecord'];


  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
       'OwnerID':OwnerID,
      'type':type,
      'breed':breed,

      'Age':Age,
      'gender':gender,
      'weight':weight,
      'MadicalRecord':MadicalRecord?.toMap(),

    };
  }


}