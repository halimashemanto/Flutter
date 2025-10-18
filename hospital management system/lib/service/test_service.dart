import 'dart:convert';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:http/http.dart' as http;
import '../entity/test_model.dart';

class TestService {
  final String baseUrl = "http://localhost:8080/api/tests/";
  final AuthService _authService = AuthService();

  Future<List<Test>> getAllTests() async {
    String? token = await _authService.getToken();

    if (token == null) {
      print('No Token Found, Please Login First');
      return [];
    }

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Test.fromJson(json)).toList();
    } else {
      print('Failed to load tests: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load tests");
    }
  }
}
