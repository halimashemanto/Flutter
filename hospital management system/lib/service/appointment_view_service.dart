import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/appointment_view_model.dart';
import 'package:http/http.dart' as http;


class AppointmentService {
  final String baseUrl = "http://localhost:8080/api/appoinment";

  Future<List<Appointment>> getAllAppointments() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Appointment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
