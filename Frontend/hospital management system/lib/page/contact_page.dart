import 'package:flutter/material.dart';
import 'dart:ui';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade700,
        elevation: 4,
      ),
      body: Stack(
        children: [
          // ===== Background gradient =====
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFd9b3ff), Color(0xFF8ec5fc)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(color: Colors.black.withOpacity(0.1)),
          ),

          // ===== Content =====
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Get in Touch",
                  style: TextStyle(
                    color: Colors.purple.shade800,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "We’d love to hear from you! Please fill out the form below or contact us directly.",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // ===== Contact Info Cards =====
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    buildInfoCard(Icons.location_on, "Address",
                        "Dhaka, Bangladesh"),
                    buildInfoCard(Icons.phone, "Phone", "+880123456789"),
                    buildInfoCard(Icons.email, "Email",
                        "info@healthcarebd.com"),
                    buildInfoCard(Icons.access_time, "Working Hours",
                        "Sat - Thu: 9 AM - 9 PM"),
                  ],
                ),

                const SizedBox(height: 40),

                // ===== Contact Form =====
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Send us a Message",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      buildTextField("Full Name", Icons.person),
                      const SizedBox(height: 15),
                      buildTextField("Email Address", Icons.email),
                      const SizedBox(height: 15),
                      buildTextField("Message", Icons.message, maxLines: 5),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Message Sent!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        icon: const Icon(Icons.send),
                        label: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Text("Send Message",
                              style: TextStyle(fontSize: 16)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 6,
                          shadowColor: Colors.purpleAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ===== Google Map Preview =====
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image.network(
                //     "https://maps.locationiq.com/v3/staticmap?key=pk.1bba15e5b2b84d8c9f89c21b9a5f9a4e&center=23.8103,90.4125&zoom=12&size=600x300&markers=icon:small-red-cutout|23.8103,90.4125",
                //     height: 200,
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //   )
                //
                // ),
                //
                // const SizedBox(height: 50),

                // ===== Footer =====
                const Text(
                  "© 2025 Health Care BD. All rights reserved.",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoCard(IconData icon, String title, String subtitle) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.purple.shade700, size: 36),
          const SizedBox(height: 10),
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget buildTextField(String hint, IconData icon, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.purple.shade700),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.purple.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.purple.shade700, width: 2),
        ),
      ),
    );
  }
}
