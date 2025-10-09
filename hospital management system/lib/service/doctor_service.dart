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
  
  
  
  
  
  
  
  
  
}