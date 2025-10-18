class Medicine {
  final int id;
  final String medicineName;

  Medicine({required this.id, required this.medicineName});

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      medicineName: json['medicineName'],
    );
  }
}
