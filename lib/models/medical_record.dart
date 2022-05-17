

class medical_record{
  late List vaccinations;
  late List diseases;
  late List medicines;
  medical_record({
    required this.vaccinations,
    required this.diseases,
    required this.medicines,
  });
  medical_record.fromJson(Map<String, dynamic>json){
    vaccinations = List<String>.from(json["vaccinations"].map((x) => x));
    diseases= List<String>.from(json["diseases"].map((x) => x));
    medicines=List<String>.from(json["medicines"].map((x) => x));
  }
  Map<String, dynamic> toMap() {
    return {
      'vaccinations':List<dynamic>.from(vaccinations.map((x) => x)),
      'diseases':List<dynamic>.from(diseases.map((x) => x)),
      'medicines':List<dynamic>.from(medicines.map((x) => x))
  };
  }

}