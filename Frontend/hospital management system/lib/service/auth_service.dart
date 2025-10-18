import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthService{
  final String baseUrl = "http://localhost:8080";

  Future<bool> login(String email, String password) async{

  final url = Uri.parse('$baseUrl/auth/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  final response = await http.post(url, headers:headers,body:body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    final data = jsonDecode(response.body);
    String token = data['token'];

    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String role = payload['role'];

    // Store token and role
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setString('userRole', role);

    return true;
  }

  else {
    print('Failed to log in: ${response.body}');
    return false;
  }
  }

                                    //==========REGISTRATION PART START FROM HERE============


  /// Registers a doctor (for Web & Mobile) by sending
  /// user data, doctor data, and optional photo (file or bytes)
  Future<bool> registerDoctorWeb({
    required Map<String, dynamic> user,      // User data (username, email, password, etc.)
    required Map<String, dynamic> doctor,    // doctor-specific data
    File? photoFile,                         // Photo file (used on mobile/desktop platforms)
    Uint8List? photoBytes,                   // Photo bytes (used on web platforms)
  }) async {
    // Create a multipart HTTP request (POST) to your backend API
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/doctor/'), // Backend endpoint
    );

    // Convert User map into JSON string and add to request fields
    request.fields['user'] = jsonEncode(user);

    // Convert doctor map into JSON string and add to request fields
    request.fields['doctor'] = jsonEncode(doctor);

    // ---------------------- IMAGE HANDLING ----------------------

    // If photoBytes is available (e.g., from web image picker)
    if (photoBytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
          'photo',                // backend expects field name 'photo'
          photoBytes,             // Uint8List is valid here
          filename: 'profile.png' // arbitrary filename for backend
      ));
    }

    // If photoFile is provided (mobile/desktop), attach it
    else if (photoFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',                // backend expects field name 'photo'
        photoFile.path,         // file path from File object
      ));
    }

    // --------- SEND REQUEST ------------

    // Send the request to backend
    var response = await request.send();

    // Return true if response code is 200 (success)
    return response.statusCode == 200;
  }


  //=========================END Doctor Reg part================================



  /// Registers a NURSE (for Web & Mobile) by sending


  Future<bool> registerNurseWeb({
    required Map<String, dynamic> user,
    required Map<String, dynamic> nurse,
    File? photoFile,
    Uint8List? photoBytes,
  }) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/nurse/'),
    );


    request.fields['user'] = jsonEncode(user);


    request.fields['nurse'] = jsonEncode(nurse);

    // ---------------------- IMAGE HANDLING ----------------------


    if (photoBytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
          'photo',
          photoBytes,
          filename: 'profile.png'
      ));
    }


    else if (photoFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        photoFile.path,
      ));
    }



    var response = await request.send();


    return response.statusCode == 200;
  }


  //=========================END NURSE Reg part================================


  /// Registers a receptionist (for Web & Mobile) by sending


  Future<bool> registerReceptionistWeb({
    required Map<String, dynamic> user,
    required Map<String, dynamic> receptionist,
    File? photoFile,
    Uint8List? photoBytes,
  }) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/receptionist/'),
    );


    request.fields['user'] = jsonEncode(user);


    request.fields['receptionist'] = jsonEncode(receptionist);

    // ---------------------- IMAGE HANDLING ----------------------


    if (photoBytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
          'photo',
          photoBytes,
          filename: 'profile.png'
      ));
    }

    // If photoFile is provided (mobile/desktop), attach it
    else if (photoFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        photoFile.path,
      ));
    }

    // --------- SEND REQUEST ------------


    var response = await request.send();

    return response.statusCode == 200;
  }


  //=========================END Receptionist Reg part================================


  /// Registers a OfficeStaff (for Web & Mobile) by sending


  Future<bool> registerOfficeStaffWeb({
    required Map<String, dynamic> user,
    required Map<String, dynamic> officeStaff,
    File? photoFile,
    Uint8List? photoBytes,
  }) async {
    // Create a multipart HTTP request (POST) to your backend API
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/officeStaff/'),
    );


    request.fields['user'] = jsonEncode(user);


    request.fields['officeStaff'] = jsonEncode(officeStaff);

    // ---------------------- IMAGE HANDLING ----------------------

    // If photoBytes is available (e.g., from web image picker)
    if (photoBytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
          'photo',
          photoBytes,
          filename: 'profile.png'
      ));
    }

    // If photoFile is provided (mobile/desktop), attach it
    else if (photoFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'photo',
        photoFile.path,
      ));
    }


    var response = await request.send();


    return response.statusCode == 200;
  }


  //=========================END OfficeStaff Reg part================================



                                        //===========END REGISTRATION part==========




  Future<String?> getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('userRole'));
    return prefs.getString('userRole');
  }


  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }


  Future<bool> isTokenExpired() async {
    String? token = await getToken();
    if (token != null) {
      DateTime expiryDate = Jwt.getExpiryDate(token)!;
      return DateTime.now().isAfter(expiryDate);
    }
    return true;
  }


  Future<bool> isLoggedIn() async {
    String? token = await getToken();
    if (token != null && !(await isTokenExpired())) {
      return true;
    }

    else {
      await logout();
      return false;
    }
  }


  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    await prefs.remove('userRole');
  }


  Future<bool> hasRole(List<String> roles) async {
    String? role = await getUserRole();
    return role != null && roles.contains(role);
  }


  Future<bool> isAdmin() async {
    return await hasRole(['Admin']);
  }

  Future<bool> isDoctor() async {
    return await hasRole(['Doctor']);
  }


  Future<bool> isNurse() async {
    return await hasRole(['Nurse']);
  }

  Future<bool> isReceptionist() async {
    return await hasRole(['Receptionist']);
  }

  Future<bool> isOfficeStaff() async {
    return await hasRole(['OfficeStaff']);
  }









  }

