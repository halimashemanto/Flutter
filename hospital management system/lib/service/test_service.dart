import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/test_model.dart';

class TestService {
  final String baseUrl = "http://localhost:8080/api/tests/";

  Future<List<Test>> getAllTests() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Test.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load tests");
    }
  }
}
