class Department {
  final int id;
  final String departmentName;
  final String description;

  Department({
    required this.id,
    required this.departmentName,
    required this.description,
  });

  // JSON থেকে object তৈরি করার জন্য factory
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'] ?? 0,
      departmentName: json['departmentName'] ?? '',
      description: json['description'] ?? '',
    );
  }

  // Object থেকে JSON তৈরির জন্য method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'departmentName': departmentName,
      'description': description,
    };
  }
}
