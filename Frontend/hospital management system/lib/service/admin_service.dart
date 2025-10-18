import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hospitalmanagementsystem/service/auth_service.dart';


class AdminService {


  final String baseUrl = "http://localhost:8080";

  Future<Map<String, dynamic>?> getAdminProfile() async {
    String? token = await AuthService().getToken();

    if (token == null) {
      print('No Token Found, Please Login First');
      return null;
    }

    final url = Uri.parse('$baseUrl/auth/user/role/Admin');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Handle if API returns a List
        if (data is List && data.isNotEmpty) {
          return data[0] as Map<String, dynamic>;
        }

        // Handle if API returns a Map
        if (data is Map<String, dynamic>) {
          return data;
        }

        print('Unexpected response format: ${response.body}');
        return null;
      } else {
        print('Failed to load profile: ${response.statusCode} - ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching admin profile: $e');
      return null;
    }
  }


















}