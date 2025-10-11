import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/department.dart';
import 'package:http/http.dart' as http;
import '../entity/doctor_model.dart';
import '../entity/schedule_slot_model.dart';
import '../entity/appointment_model.dart';

class HospitalService {
  final String baseUrl = "http://localhost:8080/api";

  // ================= Department =================
  Future<List<Department>> getAllDepartments() async {
    final response = await http.get(Uri.parse("$baseUrl/department/"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Department.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch departments");
    }
  }

  // ================= Doctor =================
  Future<List<Doctor>> getDoctorsByDepartment(int departmentId) async {
    final response = await http.get(Uri.parse("$baseUrl/doctor/department/$departmentId"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Doctor.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch doctors for department $departmentId");
    }
  }

  // ================= ScheduleSlot =================
  Future<List<ScheduleSlot>> getAvailableSlotsByDoctor(int doctorId) async {
    final response = await http.get(Uri.parse("$baseUrl/slot/doctor/$doctorId"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => ScheduleSlot.fromJson(e))
          .where((slot) => slot.isBooked == false) // Only available
          .toList();
    } else {
      throw Exception("Failed to fetch slots for doctor $doctorId");
    }
  }

  // ================= Appointment =================
  Future<void> bookAppointment(Appointment appointment) async {
    final response = await http.post(
      Uri.parse("$baseUrl/appoinment"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(appointment.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to book appointment: ${response.body}");
    }
  }
}
