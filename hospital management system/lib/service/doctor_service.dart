import 'dart:convert';

import 'package:hospitalmanagementsystem/entity/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'package:hospitalmanagementsystem/service/auth_service.dart';


class DoctorService {
  
  
  final String baseUrl = "http://localhost:8080";
  
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








  Future<List<Doctor>> getAllDoctors() async {
    final response = await http.get(Uri.parse("$baseUrl/api/doctor/"));
    if (response.statusCode == 200) {
      List jsonList = json.decode(response.body);
      return jsonList.map((e) => Doctor.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load doctors");
    }
  }




  Future<List<Map<String, dynamic>>> getAllDoctor() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // expect: [{id:1, name:"Dr. Smith"}, ...]
      return data.map((e) => {
        'id': e['id'],
        'name': e['name'],
      }).toList();
    } else {
      throw Exception('Failed to fetch doctors');
    }
  }





  /// ✅ Get doctors filtered by department ID



    Future<List<Doctor>> getDoctorsByDepartment(int deptId) async {
      final url = Uri.parse("$baseUrl/api/doctor/by-department/$deptId"); // include /api
      final response = await http.get(url); // no token needed for visitors

      if (response.statusCode == 200) {
        List jsonList = json.decode(response.body);
        return jsonList.map((e) => Doctor.fromJson(e)).toList();
      } else {
        throw Exception(
            "Failed to load doctors: ${response.statusCode} - ${response.body}");
      }
    }







/// ✅ Visitor-friendly: Get doctors by department WITHOUT token
Future<List<Doctor>> getDoctorsByDepartmentWithoutToken(int departmentId) async {
  final url = Uri.parse("baseUrl/api/doctor/by-department/$departmentId");

  final response = await http.get(url); // Token নেই, সোজা GET

  if (response.statusCode == 200) {
    List jsonList = json.decode(response.body);
    return jsonList.map((e) => Doctor.fromJson(e)).toList();
  } else {
    throw Exception(
        "Failed to load doctors: ${response.statusCode} - ${response.body}");
  }
}







}




  
  
