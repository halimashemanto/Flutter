import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/loginregistration/registrationpage.dart';
import 'package:hospitalmanagementsystem/page/appointment_page.dart';
import 'package:hospitalmanagementsystem/page/contact_page.dart';
import 'package:hospitalmanagementsystem/page/department_doctor_filter_page.dart';
import 'package:hospitalmanagementsystem/page/department_page.dart';
import 'package:hospitalmanagementsystem/page/facility_page.dart';
import 'package:hospitalmanagementsystem/page/home_page.dart';
import 'package:hospitalmanagementsystem/profile/doctor_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care of Bangladesh',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // Default home page
      home: const ModernHomePage(),

      // Routing map
      routes: {
        '/login': (context) => LoginPage(),
        '/appointment': (context) => const AppointmentPageWidget(),
        '/register': (context) => const Registration(),
        '/departments': (context) => const DepartmentDoctorPage(),
        '/doctors': (context) => const DoctorPage(),
        '/contact': (context) => const ContactPage(),
        '/facility': (context) => const FacilityPage(),

      },
    );
  }
}
