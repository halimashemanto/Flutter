import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/page/appointment_page.dart';
import 'package:hospitalmanagementsystem/page/home_page.dart';

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
        '/login': (context) => LoginPage(),                 // Login page
        '/appointment': (context) => const AppointmentPageWidget(), // Appointment page
      },
    );
  }
}
