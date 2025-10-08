import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:radio_group_v2/radio_group_v2.dart' as v2;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _obscurePassword = true;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController cell = TextEditingController();
  final TextEditingController address = TextEditingController();

  final RadioGroupController genderController = RadioGroupController();

  final DateTimeFieldPickerPlatform dob = DateTimeFieldPickerPlatform.material;

  String? selectedGender;

  DateTime? selectedDOB;

  XFile? selectedImage;

  Uint8List? webImage;

  final ImagePicker _picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(




      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)], // fresh blue gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // 🌟 Animated Logo
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.8, end: 1.0),
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.local_hospital,
                            size: 50,
                            color: Color(0xFF00ACC1), // cyan accent
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Trust, Hope & Healing — Your Health Our Priority",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 30),

                  // 🌈 Name Field
                  _buildAnimatedField(
                      controller: name,
                      label: "Full Name",
                      icon: Icons.person,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent),
                  const SizedBox(height: 20),

                  // 🌈 Email Field
                  _buildAnimatedField(
                      controller: email,
                      label: "Email",
                      icon: Icons.alternate_email,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent),
                  const SizedBox(height: 20),

                  // 🌈 Password Field
                  _buildAnimatedField(
                      controller: password,
                      label: "Password",
                      icon: Icons.lock,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      )),
                  const SizedBox(height: 20),

                  // 🌈 Confirm Password Field
                  _buildAnimatedField(
                      controller: confirmPassword,
                      label: "Confirm Password",
                      icon: Icons.lock,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent,
                      obscureText: true),
                  const SizedBox(height: 20),

                  // 🌈 Cell
                  _buildAnimatedField(
                      controller: cell,
                      label: "Cell Number",
                      icon: Icons.phone,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent),
                  const SizedBox(height: 20),

                  // 🌈 Address
                  _buildAnimatedField(
                      controller: address,
                      label: "Address",
                      icon: Icons.maps_home_work_rounded,
                      context: context,
                      fillColor: Colors.white.withOpacity(0.2),
                      iconColor: Colors.orangeAccent),
                  const SizedBox(height: 20),

                  // 🌈 Date of Birth
                  DateTimeFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      prefixIcon: Icon(Icons.cake, color: Colors.orangeAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    pickerPlatform: dob,
                    onChanged: (DateTime? value) {
                      setState(() {
                        selectedDOB = value;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  // 🌈 Gender Selection
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Gender:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        v2.RadioGroup(
                          controller: genderController,
                          values: const ["Male", "Female", "Other"],
                          indexOfDefault: 2,
                          orientation: RadioGroupOrientation.horizontal,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue.toString();
                            });
                          }
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🌈 Upload Image
                  ElevatedButton.icon(
                    icon: Icon(Icons.image),
                    label: Text('Upload Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent.shade700,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: pickImage,
                  ),
                  const SizedBox(height: 20),

                  // 🌟 Image Preview
                  if (kIsWeb && webImage != null)
                    Image.memory(webImage!, height: 100, width: 100, fit: BoxFit.cover)
                  else if (!kIsWeb && selectedImage != null)
                    Image.file(File(selectedImage!.path),
                        height: 100, width: 100, fit: BoxFit.cover),

                  const SizedBox(height: 30),

                  // 🌟 Registration Button
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.cyanAccent.shade400, Colors.cyanAccent.shade700]),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: _register,
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🌈 Login redirect
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),







    );
  }

  Future<void> pickImage() async {
    if (kIsWeb) {
      // For Web: Use image_picker_web to pick image and store as bytes
      var pickedImage = await ImagePickerWeb.getImageAsBytes();
      if (pickedImage != null) {
        setState(() {
          webImage = pickedImage; // Store the picked image as Uint8List
        });
      }
    } else {
      // For Mobile: Use image_picker to pick image
      final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        setState(() {
          selectedImage = pickedImage;
        });
      }
    }
  }

  /// Method to handle  DOCTOR registration
  void _register() async {
    // ✅ Check if the form (text fields) is valid
    if (_formKey.currentState!.validate()) {
      // ✅ Check if password and confirm password match
      if (password.text != confirmPassword.text) {
        // Show an error message if passwords don’t match
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Passwords do not match!')));
        return; // stop further execution
      }

      // ✅ Validate that the user has selected an image
      if (kIsWeb) {
        // On Web → check if webImage (Uint8List) is selected
        if (webImage == null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Please select an image.')));
          return; // stop further execution
        }
      } else {
        // On Mobile/Desktop → check if image file is selected
        if (selectedImage == null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Please select an image.')));
          return; // stop further execution
        }
      }

      // ✅ Prepare User object (basic login info)
      final user = {
        "name": name.text,
        "email": email.text,
        "phone": cell.text,
        "password": password.text,
      };

      // ✅ Prepare DOCTOR object (extra personal info)
      final doctor = {
        "name": name.text,
        "email": email.text,
        "phone": cell.text,
        "gender": selectedGender ?? "Other",
        // fallback if null
        "address": address.text,
        "dateOfBirth": selectedDOB?.toIso8601String() ?? "",
        // convert DateTime to ISO string
      };

      // ✅ Initialize your API Service
      final apiService = AuthService();

      // ✅ Track API call success or failure
      bool success = false;

      // ✅ Send registration request (different handling for Web vs Mobile)
      if (kIsWeb && webImage != null) {
        // For Web → send photo as bytes
        success = await apiService.registerDoctorWeb(
          user: user,
          doctor: doctor,
          photoBytes: webImage!, // safe to use ! because already checked above
        );
      } else if (selectedImage != null) {
        // For Mobile → send photo as file
        success = await apiService.registerDoctorWeb(
          user: user,
          doctor: doctor,
          photoFile: File(
            selectedImage!.path,
          ), // safe to use ! because already checked above
        );
      }

      // ✅ Handle the API response
      if (success) {
        // Show success message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Registration Successful')));

        // Redirect user to Login Page after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {}
    }
  }
}

//======End class of Registration ============










// ---------------- Helper Method ----------------
Widget _buildAnimatedField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool obscureText = false,
  Widget? suffixIcon,
  required BuildContext context,
  Color fillColor = Colors.white24,
  Color iconColor = Colors.white,
}) {
  return TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: 0.0, end: 1.0),
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeOut,
    builder: (context, value, child) {
      return Transform.translate(
        offset: Offset(0, 50 * (1 - value)),
        child: Opacity(
          opacity: value,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon, color: iconColor),
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white70)),
              suffixIcon: suffixIcon,
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    },
  );
}
