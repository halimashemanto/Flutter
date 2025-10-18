class ScheduleSlot {
  final int id;
  final String date;
  final String startTime;
  final String endTime;
  final bool isBooked;
  final String doctorName;

  ScheduleSlot({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isBooked,
    required this.doctorName,
  });

  factory ScheduleSlot.fromJson(Map<String, dynamic> json) {
    return ScheduleSlot(
      id: json['id'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      isBooked: json['booked'] == true,  




      doctorName: json['doctorName'] ?? 'Unknown',
    );
  }
}
