import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/medicine_model.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;


class MedicineService {
  final String baseUrl = "http://localhost:8080/api/medicine/";

  final AuthService _authService = AuthService();

  Future<List<Medicine>> getAllMedicines() async {
    // 🔹 Get saved token
    String? token = await _authService.getToken();

    if (token == null) {
      print('No Token Found, Please Login First');
      return [];
    }

    // 🔹 Send request with Authorization header
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Medicine.fromJson(json)).toList();
    } else {
      print('Failed to load medicines: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load medicines");
    }
  }
}
