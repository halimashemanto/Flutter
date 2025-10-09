import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:hospitalmanagementsystem/page/test_page.dart';
import 'package:hospitalmanagementsystem/page/medicine_page.dart';



class DoctorProfile extends StatelessWidget {
  final Map<String, dynamic> profile;
  final AuthService _authService =
  AuthService(); // Create instance of AuthService


  DoctorProfile({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------------------------
    // BASE URL for loading images
    // ----------------------------
    final String baseUrl = "http://localhost:8080/images/doctor/";


    final String? photoName = profile['photo'];

    // Build full photo URL only if photo exists
    final String? photoUrl = (photoName != null && photoName.isNotEmpty)
        ? "$baseUrl$photoName"
        : null;

    // ----------------------------
    // SCAFFOLD: Main screen layout
    // ----------------------------
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 4,
      ),

      // ----------------------------
      // DRAWER: Side navigation menu
      // ----------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Removes extra top padding
          children: [
            // 🟣 Drawer Header with user info
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              accountName: Text(
                profile['name'] ?? 'Unknown User',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(profile['email'] ?? 'N/A'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: (photoUrl != null)
                    ? NetworkImage(photoUrl)
                    : const AssetImage('assets/images/default_avatar.jpg')
                as ImageProvider,
              ),
            ),

            // 🟣 Menu Items (you can add more later)
            ListTile(
              leading: const Icon(Icons.medical_services), // Test related icon
              title: const Text('Test'),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TestPage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Medicines'),
              onTap: () {
                Navigator.pop(context); // Drawer close
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MedicinePage()),
                );
              },
            ),





            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Open settings page
                Navigator.pop(context);
              },
            ),

            const Divider(), // Thin line separator
            // 🔴 Logout Option
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () async {
                // Clear stored token and user role
                await _authService.logout();

                // Navigate back to login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),

      // ----------------------------
      // BODY: Main content area
      // ----------------------------


      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              //  Profile Picture
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: (photoUrl != null)
                      ? NetworkImage(photoUrl)
                      : const AssetImage('assets/images/default_avatar.jpg')
                  as ImageProvider,
                ),
              ),

              const SizedBox(height: 20),

              //  Name
              Text(
                profile['name'] ?? 'Unknown Doctor',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00695C),
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 10),

              //  Email &  Phone
              _buildInfoRow(Icons.email, profile['email'], Colors.blueGrey),
              const SizedBox(height: 6),
              _buildInfoRow(Icons.phone_android, profile['phone'], Colors.teal),

              const SizedBox(height: 25),

              //  Animated Info Cards
              _buildAnimatedInfoCard(Icons.verified_user, "Status", profile['status']),
              _buildAnimatedInfoCard(Icons.school, "Study", profile['study']),
              _buildAnimatedInfoCard(Icons.local_hospital, "Chamber", profile['chamber']),
              _buildAnimatedInfoCard(Icons.account_balance, "Department", profile['departmentName']),
              _buildAnimatedInfoCard(Icons.description, "Dept Description", profile['departmentDescription']),

              const SizedBox(height: 30),

              // ✏️ Edit Button

              // 💬 Slogan
              const Text(
                "“Healing is not just a duty — it’s a calling of the heart.”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

//======End body part=====









    );
  }
}


//== End class ===









// 🔹 Helper Widgets (inside same file)
Widget _buildInfoRow(IconData icon, String? value, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color, size: 22),
      const SizedBox(width: 8),
      Text(
        value ?? 'N/A',
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    ],
  );
}

Widget _buildAnimatedInfoCard(IconData icon, String label, dynamic value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF89F7FE), Color(0xFF66A6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value ?? 'N/A',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}