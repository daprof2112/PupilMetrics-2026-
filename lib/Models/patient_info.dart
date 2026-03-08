// lib/models/patient_info.dart
// UNIFIED PatientInfo class - SINGLE SOURCE OF TRUTH
// All other files should import from here

enum Sex { male, female }

class PatientInfo {
  final String name;
  final Sex sex;
  final int age;
  final String? mainComplaints;

  PatientInfo({
    required this.name,
    required this.sex,
    required this.age,
    this.mainComplaints,
  });

  String get sexString => sex == Sex.male ? 'Male' : 'Female';

  // Backward compatibility alias
  String get genderString => sexString;

  Map<String, dynamic> toJson() => {
    'name': name,
    'sex': sexString,
    'age': age,
    'mainComplaints': mainComplaints,
  };
}