class appointment{
String? Status;
String? DayTime;
String? PetID;
String? PetOwnerID;
String? DoctorID;

appointment({
  this.PetID,
  this.DoctorID,
  this.PetOwnerID,
  this.DayTime,
  this.Status

});

appointment.fromJson(Map<String, dynamic>json){
  Status=json['Status'];
  DayTime=json['DayTime'];
  PetOwnerID=json['PetOwnerID'];
  Status=json['Status'];
  PetID=json['PetID'];
}
Map<String, dynamic> toMap() {
  return {
    'PetID': PetID ?? '',
    'DoctorID': DoctorID ?? '',
    'PetOwnerID': PetOwnerID ?? '',
    'DayTime': DayTime ?? '',
    'Status': Status ?? '',

  };
}
}