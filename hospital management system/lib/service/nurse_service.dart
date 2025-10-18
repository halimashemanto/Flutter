import 'dart:convert';
import 'package:hospitalmanagementsystem/entity/nurse_model.dart';
import 'package:http/http.dart' as http;
import 'package:hospitalmanagementsystem/service/auth_service.dart';


class NurseService {


  final String baseUrl = "http://localhost:8080";

  Future<Map<String,dynamic>?> getNurseProfile() async{
    String? token = await AuthService().getToken();

    if(token == null){
      print ('No Token Found, Please Login First');
      return null;

    }
    final url = Uri.parse('$baseUrl/api/nurse/nurseprofile');
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




//for showing all nurse
  Future<List<Nurse>> getAllNurses() async {
    String? token = await AuthService().getToken();

    if (token == null) {
      print('No Token Found, Please Login First');
      return [];
    }

    final response = await http.get(
      Uri.parse("http://localhost:8080/api/nurse/all"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Nurse.fromJson(json)).toList();
    } else {
      print('Failed to load nurses: ${response.statusCode} - ${response.body}');
      throw Exception("Failed to load nurses");
    }
  }











}