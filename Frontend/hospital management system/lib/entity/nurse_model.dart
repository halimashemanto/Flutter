class Nurse {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String nurseType;
  final String gender;
  final String shift;
  final String workingHours;
  final String photo;

  Nurse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.nurseType,
    required this.gender,
    required this.shift,
    required this.workingHours,
    required this.photo,
  });

  factory Nurse.fromJson(Map<String, dynamic> json) {
    return Nurse(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      nurseType: json['nurseType'] ?? '',
      gender: json['gender'] ?? '',
      shift: json['shift'] ?? '',
      workingHours: json['workingHours'] ?? '',
      photo: json['photo'] ?? '',
    );
  }
}
