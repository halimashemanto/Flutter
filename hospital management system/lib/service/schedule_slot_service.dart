import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/schedule_slot_model.dart';

class ScheduleSlotService {
  final String baseUrl = "http://localhost:8080/api/slot";

  Future<List<ScheduleSlot>> getSlotsByDoctor(int doctorId) async {
    final response = await http.get(Uri.parse("$baseUrl/doctor/$doctorId"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ScheduleSlot.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load slots");
    }
  }
}
