class Appointment {
  final int id;
  final String patientName;
  final String patientContact;
  final String reason;
  final int doctorId;
  final String doctorName;
  final int departmentId;
  final String departmentName;
  final int scheduleSlotId;
  final DateTime slotDate;
  final String slotStartTime;
  final String slotEndTime;

  Appointment({
    required this.id,
    required this.patientName,
    required this.patientContact,
    required this.reason,
    required this.doctorId,
    required this.doctorName,
    required this.departmentId,
    required this.departmentName,
    required this.scheduleSlotId,
    required this.slotDate,
    required this.slotStartTime,
    required this.slotEndTime,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? 0,
      patientName: json['patientName'] ?? '',
      patientContact: json['patientContact'] ?? '',
      reason: json['reason'] ?? '',
      doctorId: json['doctorId'] ?? 0,
      doctorName: json['doctorName'] ?? '',
      departmentId: json['departmentId'] ?? 0,
      departmentName: json['departmentName'] ?? '',
      scheduleSlotId: json['scheduleSlotId'] ?? 0,
      slotDate: DateTime.parse(json['slotDate']),
      slotStartTime: json['slotStartTime'] ?? '',
      slotEndTime: json['slotEndTime'] ?? '',
    );
  }
}
