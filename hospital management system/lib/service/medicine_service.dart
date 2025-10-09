import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/medicine_model.dart';
import 'package:http/http.dart' as http;


class MedicineService {
  final String baseUrl = "http://localhost:8080/api/medicine/";

  Future<List<Medicine>> getAllMedicines() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Medicine.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load medicines");
    }
  }
}
