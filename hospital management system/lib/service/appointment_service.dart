import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/department.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;
import '../entity/doctor_model.dart';
import '../entity/schedule_slot_model.dart';
import '../entity/appointment_model.dart';

class HospitalService {
  final String baseUrl = "http://localhost:8080/api";

  final AuthService _authService = AuthService();

  // ================= Department =================
  Future<List<Department>> getAllDepartments() async {
    final url = Uri.parse("$baseUrl/department/");
    final token = await _authService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Department.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch departments: ${response.statusCode}");
    }
  }

  // ================= Doctor =================
  Future<List<Doctor>> getDoctorsByDepartment(int departmentId) async {
    final url = Uri.parse("$baseUrl/doctor/by-department/$departmentId");
    final token = await _authService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Doctor.fromJson(e)).toList();
    } else {
      throw Exception(
          "Failed to fetch doctors for department $departmentId: ${response.statusCode}");
    }
  }

  // ================= ScheduleSlot =================
  Future<List<ScheduleSlot>> getAvailableSlotsByDoctor(int doctorId) async {
    final url = Uri.parse("$baseUrl/slot/doctor/$doctorId");
    final token = await _authService.getToken();

    final headers = {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((e) => ScheduleSlot.fromJson(e))
          .where((slot) => slot.isBooked == false)
          .toList();
    } else {
      throw Exception("Failed to fetch slots for doctor $doctorId: ${response.statusCode}");
    }
  }

  // ================= Appointment =================
  Future<bool> bookAppointment(Appointment appointment) async {
    final url = Uri.parse("$baseUrl/appoinment/");
    final token = await _authService.getToken();

    if (token == null) {
      print("❌ No token found. Please log in first.");
      return false;
    }

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(appointment.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("✅ Appointment booked successfully");
      return true;
    } else {
      print("❌ Failed to book appointment: ${response.statusCode} - ${response.body}");
      return false;
    }
  }
}
