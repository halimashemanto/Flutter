import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/department.dart';
import 'package:http/http.dart' as http;


class DepartmentService {
  final String baseUrl = "http://localhost:8080/api";

  Future<List<Department>> getDepartments() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/department/"));

      if (response.statusCode == 200) {
        List jsonList = json.decode(response.body);
        List<Department> departments =
        jsonList.map((e) => Department.fromJson(e)).toList();
        return departments;
      } else {
        throw Exception("Failed to load departments");
      }
    } catch (e) {
      throw Exception("Error fetching departments: $e");
    }
  }
}
