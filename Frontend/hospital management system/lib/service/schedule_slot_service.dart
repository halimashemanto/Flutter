import 'dart:convert';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;
import '../entity/schedule_slot_model.dart';

class ScheduleSlotService {
  final String baseUrl = "http://localhost:8080/api/slot";
  final AuthService _authService = AuthService();

  Future<List<ScheduleSlot>> getSlotsByDoctor(int doctorId) async {

    String? token = await _authService.getToken();

    if(token == null){
      print("No Token found.");
      return[];

    }

    final url = Uri.parse('$baseUrl/doctor/$doctorId');


    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      print("SLOTS RESPONSE: ${response.body}");

      return jsonList.map((json) => ScheduleSlot.fromJson(json)).toList();
    } else {
      print('Failed to load slots: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load slots");
    }
  }
}
