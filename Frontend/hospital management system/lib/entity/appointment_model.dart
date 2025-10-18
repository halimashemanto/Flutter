class Appointment {
  final String patientName;
  final String patientContact;
  final String reason;
  final int departmentId;
  final int doctorId;
  final int scheduleSlotId;

  Appointment({
    required this.patientName,
    required this.patientContact,
    required this.reason,
    required this.departmentId,
    required this.doctorId,
    required this.scheduleSlotId,
  });

  Map<String, dynamic> toJson() {
    return {
      'patientName': patientName,
      'patientContact': patientContact,
      'reason': reason,
      'department': {'id': departmentId},
      'doctor': {'id': doctorId},
      'scheduleSlot': {'id': scheduleSlotId},
    };
  }

}
