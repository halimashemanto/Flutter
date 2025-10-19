import 'dart:convert';

import 'package:hospitalmanagementsystem/entity/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'package:hospitalmanagementsystem/service/auth_service.dart';


class DoctorService {
  
  
  final String baseUrl = "http://localhost:8080";
  final AuthService _authService = AuthService();
  
  Future<Map<String,dynamic>?> getDoctorProfile() async{
    String? token = await AuthService().getToken();
    
    if(token == null){
      print ('No Token Found, Please Login First');
      return null;    
      
    }
    final url = Uri.parse('$baseUrl/api/doctor/profile');
    final response = await http.get(

      url,
      headers:{
        'Authorization': 'Bearer $token',
        'Content-Type':'application/json',
      },
    );

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }

    else{
      print('Failed to load profile: ${response.statusCode} - ${response.body}');
      return null;
    }
    
    
  }







  // All doctors
  Future<List<Doctor>> getAllDoctors() async {
    // String? token = await _authService.getToken();
    //
    // if (token == null) {
    //   print('No Token Found, Please login first.');
    //   return [];
    // }

    final response = await http.get(
      Uri.parse("$baseUrl/api/doctor/"),
      // headers: {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json',
      // },
    );

    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => Doctor.fromJson(e)).toList();
    } else {
      print('Failed to load doctors: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load doctors");
    }
  }

  //Lightweight list for dropdowns etc.
  Future<List<Map<String, dynamic>>> getAllDoctor() async {
    String? token = await _authService.getToken();

    if (token == null) {
      print('No Token Found, Please login first.');
      return [];
    }

    final response = await http.get(
      Uri.parse("$baseUrl/api/doctor/"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => {
        'id': e['id'],
        'name': e['name'],
      }).toList();
    } else {
      print('Failed to fetch doctors: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to fetch doctors');
    }
  }

  ///  Get doctors filtered by department ID (Token Required)
  Future<List<Doctor>> getDoctorsByDepartment(int deptId) async {
    // String? token = await _authService.getToken();
    //
    // if (token == null) {
    //   print('No Token Found, Please login first.');
    //   return [];
    // }

    final url = Uri.parse("$baseUrl/api/doctor/by-department/$deptId");
    final response = await http.get(
      url,
      // headers: {
      //   'Authorization': 'Bearer $token',
      //   'Content-Type': 'application/json',
      // },
    );

    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => Doctor.fromJson(e)).toList();
    } else {
      print('Failed to load doctors: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load doctors");
    }
  }

  /// Visitor-friendly: public endpoint (no token)
  Future<List<Doctor>> getDoctorsByDepartmentWithoutToken(int departmentId) async {
    final url = Uri.parse("$baseUrl/api/doctor/by-department/$departmentId");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => Doctor.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load doctors: ${response.statusCode} - ${response.body}");
    }
  }




}




  
  
