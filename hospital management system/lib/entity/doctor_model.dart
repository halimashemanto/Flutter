class Doctor {
  final int id;
  final String name;
  final String specialization;
  final String study;
  final String email;
  final String phone;
  final String chamber;
  final String? photo;
  final String? status;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.study,
    required this.email,
    required this.phone,
    required this.chamber,
    required this.status,
    this.photo,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      study: json['study'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      chamber: json['chamber'] ?? '',
      status: json['status'] ?? '',
      photo: json['photo'],
    );
  }
}
