import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/department.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;


class DepartmentService {
  final String baseUrl = "http://localhost:8080/api";

  final AuthService _authService = AuthService();

  Future<List<Department>> getDepartments() async {
    try {
      // 🔹 Get saved token
      String? token = await _authService.getToken();

      if (token == null) {
        print("No Token Found. Please login first.");
        return [];
      }

      // 🔹 Send authorized request
      final response = await http.get(
        Uri.parse("$baseUrl/department/"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List jsonList = json.decode(response.body);
        List<Department> departments =
        jsonList.map((e) => Department.fromJson(e)).toList();
        return departments;
      } else {
        print(
            "Failed to load departments: ${response.statusCode} - ${response.body}");
        throw Exception("Failed to load departments");
      }
    } catch (e) {
      throw Exception("Error fetching departments: $e");
    }
  }







  /// ✅ Alias method — same as getDepartments()
  /// so UI code `_departmentService.getAllDepartments()` still works
  Future<List<Department>> getAllDepartments() async {
    return await getDepartments();
  }












}
