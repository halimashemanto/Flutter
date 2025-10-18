import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/registrationpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:hospitalmanagementsystem/service/admin_service.dart';
import 'package:hospitalmanagementsystem/service/doctor_service.dart';
import 'package:hospitalmanagementsystem/service/nurse_service.dart';
import 'package:hospitalmanagementsystem/service/officestaff_service.dart';
import 'package:hospitalmanagementsystem/service/receptionist_service.dart';
import 'package:hospitalmanagementsystem/role/adminpage.dart';
import 'package:hospitalmanagementsystem/doctor/doctor_profile.dart';
import 'package:hospitalmanagementsystem/profile/nurse_profile.dart';
import 'package:hospitalmanagementsystem/profile/office_staff_profile.dart';
import 'package:hospitalmanagementsystem/profile/receptionist_profile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final AuthService authService = AuthService();
  final DoctorService doctorService = DoctorService();
  final NurseService nurseService = NurseService();
  final ReceptionistService receptionistService = ReceptionistService();
  final OfficeStaffService officeStaffService = OfficeStaffService();
  final AdminService adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Health Care Of Bangladesh",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        backgroundColor: Colors.purple.shade700,
        shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1BEE7), Color(0xFFFFFDE7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🌟 Animated Logo
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.8, end: 1.0),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  builder: (context, scale, child) {
                    return Column(
                      children: [
                        Transform.scale(
                          scale: scale,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.local_hospital,
                              size: 50,
                              color: Color(0xFF8E24AA),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Trust, Hope & Healing — Your Health Our Priority.🌿🌿",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E24AA),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),

                // Email Field
                _AnimatedTextField(
                  controller: email,
                  hintText: 'example@gmail.com',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),

                // Password Field
                _AnimatedTextField(
                  controller: password,
                  hintText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 25),

                // Login Button
                _AnimatedLoginButton(
                  text: "Login",
                  onPressed: () => loginUser(context),
                ),
                const SizedBox(height: 20),

                // Registration Link
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Registration()),
                    );
                  },
                  child: const Text(
                    'New user? Register here',
                    style: TextStyle(
                      color: Color(0xFF8E24AA),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      final response = await authService.login(email.text, password.text);
      final role = await authService.getUserRole();

      if (role == 'Admin') {
        final profile = await adminService.getAdminProfile();
        if (profile != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => AdminProfile(adminProfile: profile)));
        }
      } else if (role == 'Doctor') {
        final profile = await doctorService.getDoctorProfile();
        if (profile != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => DoctorProfile(profile: profile)));
        }
      } else if (role == 'Nurse') {
        final profile = await nurseService.getNurseProfile();
        if (profile != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => NurseProfile(profile: profile)));
        }
      } else if (role == 'OfficeStaff') {
        final profile = await officeStaffService.getOfficeStaffProfile();
        if (profile != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      OfficeStaffProfile(profile: profile)));
        }
      } else if (role == 'Receptionist') {
        final profile = await receptionistService.getReceptionistProfile();
        if (profile != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      ReceptionistProfile(profile: profile)));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unknown role')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $error')),
      );
    }
  }
}

// ===== Animated TextField =====
class _AnimatedTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const _AnimatedTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<_AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<_AnimatedTextField> {
  bool _obscurePassword = true;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: _isFocused
                ? Colors.purple.withOpacity(0.4)
                : Colors.purple.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: _isFocused ? Colors.purple : Colors.transparent,
          width: 2,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        obscureText: widget.isPassword ? _obscurePassword : false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: const Color(0xFF8E24AA)),
          hintText: widget.hintText,
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.purple,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}

// ===== Animated Login Button =====
class _AnimatedLoginButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const _AnimatedLoginButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  State<_AnimatedLoginButton> createState() => _AnimatedLoginButtonState();
}

class _AnimatedLoginButtonState extends State<_AnimatedLoginButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isHover
                ? [Color(0xFFD81B60), Color(0xFF8E24AA)]
                : [Color(0xFF8E24AA), Color(0xFFD81B60)],
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: _isHover
                  ? Colors.purple.withOpacity(0.6)
                  : Colors.purple.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding:
            const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
