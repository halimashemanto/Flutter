import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/appointment_view_model.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;


class AppointmentService {
  final String baseUrl = "http://localhost:8080/api/appoinment";

  final AuthService _authService = AuthService();

  Future<List<Appointment>> getAllAppointments() async {
    // 🔹 Get token
    String? token = await _authService.getToken();

    if (token == null) {
      print("No Token Found. Please login first.");
      return [];
    }

    // 🔹 Send request with header
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("Appointments response: ${response.body}");
      return data.map((json) => Appointment.fromJson(json)).toList();
    } else {
      print('Failed to load appointments: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load appointments');
    }
  }
}
