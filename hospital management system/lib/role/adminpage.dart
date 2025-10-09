import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:hospitalmanagementsystem/page/department_page.dart';
import 'package:hospitalmanagementsystem/page/all_nurse_page.dart';
import 'package:hospitalmanagementsystem/profile/doctor_profile.dart';


class AdminProfile extends StatelessWidget {
  final Map<String, dynamic>? adminProfile;
  final AuthService _authService = AuthService();

  AdminProfile({Key? key, required this.adminProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------------------------
    // BASE URL for loading images
    // ----------------------------
    final String baseUrl = "http://localhost:8080/images/users/";

    final String? photoName = adminProfile?['photo'];
    final String? photoUrl = (photoName != null && photoName.isNotEmpty)
        ? "$baseUrl$photoName"
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Health Care Of Bangladesh",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
        elevation: 4,
      ),

      // ----------------------------
      // DRAWER: Side navigation menu
      // ----------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              accountName: Text(
                adminProfile?['name'] ?? 'Unknown User',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(adminProfile?['email'] ?? 'N/A'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: (photoUrl != null)
                    ? NetworkImage(photoUrl)
                    : const AssetImage('assets/images/default_avatar.jpg') as ImageProvider,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () => Navigator.pop(context),
            ),


            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text('Departments'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DepartmentPage()),
                );
              },
            ),


            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text('All Doctor'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorPage()),
                );
              },
            ),


            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text('All Nurses'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NursePage()),
                );
              },
            ),





            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () async {
                await _authService.logout();
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
      // BODY: Main content
      // ----------------------------

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF283048), Color(0xFF859398)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: adminProfile == null
              ? const Text(
            "No admin data available",
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white24,
                    backgroundImage:
                    (adminProfile!['photo'] != null &&
                        adminProfile!['photo'].toString().isNotEmpty)
                        ? NetworkImage(
                        "http://localhost:8080/images/users/${adminProfile!['photo']}")
                        : const AssetImage(
                        'assets/images/default_avatar.jpg')
                    as ImageProvider,
                  ),
                  const SizedBox(height: 20),

                  // Name & Designation
                  Text(
                    adminProfile!['name'] ?? 'Unknown Admin',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    adminProfile!['designation'] ?? 'Hospital Administrator',
                    style: const TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),

                  // Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoRow(Icons.email,
                            adminProfile!['email'] ?? 'N/A'),
                        const SizedBox(height: 8),
                        _infoRow(Icons.phone,
                            adminProfile!['phone'] ?? 'N/A'),
                        const SizedBox(height: 8),
                        _infoRow(Icons.location_city,
                            adminProfile!['hospital'] ?? 'Health Care Of Bangladesh'),
                        const SizedBox(height: 8),
                        _infoRow(Icons.access_time,
                            adminProfile!['workingHours'] ?? '8:00 AM - 6:00 PM'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statCard(
                        "${adminProfile!['doctorCount'] ?? '50'}+",
                        "Doctors",
                        Icons.people_alt,
                      ),
                      _statCard(
                        "${adminProfile!['patientCount'] ?? '1200'}+",
                        "Patients",
                        Icons.healing,
                      ),
                      _statCard(
                        "${adminProfile!['departmentCount'] ?? '30'}",
                        "Departments",
                        Icons.local_hospital,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),





    );
  }
}



// ---------------- Helper for Buttons ----------------

Widget _infoRow(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, color: Colors.cyanAccent, size: 22),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ),
    ],
  );
}

Widget _statCard(String value, String label, IconData icon) {
  return Container(
    width: 100,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white30),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.cyanAccent, size: 28),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    ),
  );
}
