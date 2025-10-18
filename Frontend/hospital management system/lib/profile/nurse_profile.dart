import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';



class NurseProfile extends StatelessWidget {
  final Map<String, dynamic> profile;
  final AuthService _authService =
  AuthService(); // Create instance of AuthService


  NurseProfile({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------------------------
    // BASE URL for loading images
    // ----------------------------
    final String baseUrl = "http://localhost:8080/imagesnurse/";


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
          "Nurse Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple,
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
              decoration: const BoxDecoration(color: Colors.redAccent),
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
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
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
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       // 🟣 Profile Picture Section
      //       Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle, // Ensures circular border
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black26,
      //               blurRadius: 8,
      //               offset: Offset(0, 4),
      //             ),
      //           ],
      //           border: Border.all(
      //             color: Colors.purple, // Border color around image
      //             width: 3,
      //           ),
      //         ),
      //         child: CircleAvatar(
      //           radius: 60, // Image size
      //           backgroundColor: Colors.grey[200],
      //           backgroundImage: (photoUrl != null)
      //               ? NetworkImage(photoUrl) // From backend
      //               : const AssetImage('assets/images/default_avatar.jpg')
      //           as ImageProvider, // Local default image
      //         ),
      //       ),
      //
      //       const SizedBox(height: 20),
      //
      //       // 🟣 Display doctor Name
      //      Center(
      //        child:  Text(
      //          profile['name'] ?? 'Unknown',
      //          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //        ),
      //
      //
      //      ),
      //
      //   const SizedBox(height: 10),
      //
      //       // 🟣 Display User Email (nested under user object)
      //       Text(
      //         "Email: ${profile['email'] ?? 'N/A'}",
      //         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //
      //       // 🟣 Display Phone
      //       Text(
      //         "Contact Number: ${profile['phone'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //
      //
      //       // 🟣 Display Shift
      //       Text(
      //         "Shift: ${profile['shift'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //
      //
      //       // 🟣 Display Type
      //       Text(
      //         "Type: ${profile['nurseType'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //
      //       // 🟣 Display Join date
      //       Text(
      //         "Joining Date: ${profile['joinDate'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //
      //       // 🟣 Display workingHours
      //       Text(
      //         "Working Hours: ${profile['workingHours'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //       // 🟣 Display address
      //       Text(
      //         "Address: ${profile['address'] ?? 'N/A'}",
      //         style: const TextStyle(fontSize: 16),
      //         textAlign: TextAlign.center,
      //       ),
      //
      //       const SizedBox(height: 10),
      //
      //       // // 🟣 Button for Editing Profile
      //       // ElevatedButton.icon(
      //       //   onPressed: () {
      //       //     // TODO: Add edit functionality or navigation
      //       //   },
      //       //   icon: const Icon(Icons.edit),
      //       //   label: const Text("Edit Profile"),
      //       //   style: ElevatedButton.styleFrom(
      //       //     backgroundColor: Colors.purple,
      //       //     foregroundColor: Colors.white,
      //       //     padding: const EdgeInsets.symmetric(
      //       //       horizontal: 30,
      //       //       vertical: 12,
      //       //     ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),









      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe0c3fc), // light purple
              Color(0xFF8ec5fc), // soft blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // 🟣 Profile Picture Section with glow animation
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.5),
                      blurRadius: 18,
                      spreadRadius: 3,
                      offset: const Offset(0, 6),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.purpleAccent,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  backgroundImage: (photoUrl != null)
                      ? NetworkImage(photoUrl)
                      : const AssetImage('assets/images/default_avatar.jpg')
                  as ImageProvider,
                ),
              ),

              const SizedBox(height: 20),

              // 🩵 Nurse Name
              Center(
                child: Text(
                  profile['name'] ?? 'Unknown',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    letterSpacing: 1.1,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // 🟣 Card Section for Profile Info
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileItem(Icons.email, "Email", profile['email']),
                    _buildProfileItem(Icons.phone, "Contact Number", profile['phone']),
                    _buildProfileItem(Icons.schedule, "Shift", profile['shift']),
                    _buildProfileItem(Icons.person_outline, "Type", profile['nurseType']),
                    _buildProfileItem(Icons.calendar_month, "Joining Date", profile['joinDate']),
                    _buildProfileItem(Icons.access_time, "Working Hours", profile['workingHours']),
                    _buildProfileItem(Icons.location_on, "Address", profile['address']),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ✨ Animated motivational line
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(seconds: 2),
                child: Text(
                  "💖 Caring Hands, Healing Hearts 💖",
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),









    );
  }
}


//===== End of class===


      //===== Css part ====

Widget _buildProfileItem(IconData icon, String title, dynamic value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.purpleAccent, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "$title: ${value ?? 'N/A'}",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
