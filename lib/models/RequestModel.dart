
class RequestModel{
  String? PetID;
  String? UserID;
  String? ProviderID;

  RequestModel({
    this.UserID,
    this.PetID,
    this.ProviderID
});
  Map<String, dynamic> toMap(){
    return{
      'UserID':UserID,
      'PetID':PetID,
      'ProviderID':ProviderID
    };
  }

}
