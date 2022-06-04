class appointment{

String? Day;
String? Time;
String? PetID;
String? PetOwnerID;
String? DoctorID;
String? appoID;

appointment({
  this.PetID,
  this.DoctorID,
  this.PetOwnerID,
  this.Day,
  this.Time,


});

appointment.fromJson(Map<String, dynamic>json){

  Day=json['Day'];
  Time=json['Time'];
  PetOwnerID=json['PetOwnerID'];
   PetID=json['PetID'];
   DoctorID=json['DoctorID'];
   appoID=json['appoID'];
}
Map<String, dynamic> toMap() {
  return {
    'PetID': PetID ?? '',
    'DoctorID': DoctorID ?? '',
    'PetOwnerID': PetOwnerID ?? '',
    'Day': Day ?? '',
    'Time':Time ??''

  };
}
}