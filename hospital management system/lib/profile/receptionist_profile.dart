import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/loginregistration/loginpage.dart';
import 'package:hospitalmanagementsystem/service/auth_service.dart';
import 'package:hospitalmanagementsystem/page/schedule_slot_page.dart';



class ReceptionistProfile extends StatelessWidget {
  final Map<String, dynamic> profile;
  final AuthService _authService =
  AuthService(); // Create instance of AuthService


  ReceptionistProfile({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------------------------
    // BASE URL for loading images
    // ----------------------------
    final String baseUrl = "http://localhost:8080/images/receptionist/";


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
          "Receptionist Profile",
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
          padding: EdgeInsets.zero, // Removes extra top padding
          children: [
            // 🟣 Drawer Header with user info
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
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
              leading: const Icon(Icons.schedule),
              title: const Text('Schedule Slots'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScheduleSlotPage()),
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
              colors: [Color(0xFFE8F5E9), Color(0xFFFFFFFF)], // Soft green → white
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                // 🌟 Profile Picture with glowing halo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Colors.green.shade200, Colors.green.shade50],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 25,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: (photoUrl != null)
                          ? NetworkImage(photoUrl)
                          : const AssetImage('assets/images/default_avatar.jpg') as ImageProvider,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 👩‍💼 Name
                Text(
                  profile['name'] ?? 'Unknown Receptionist',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),

                const SizedBox(height: 10),


                // 💬 Slogan
                const Text(
                  "“Organizing care with a smile, because first impressions matter.”",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                  ),
                ),

                // 🌈 Floating field tiles
                _buildFloatingField(Icons.email, "Email", profile['email'], Colors.green.shade400),
                _buildFloatingField(Icons.phone, "Phone", profile['phone'], Colors.teal.shade400),
                _buildFloatingField(Icons.location_on, "Address", profile['address'], Colors.lightGreen.shade400),
                _buildFloatingField(Icons.wc, "Gender", profile['gender'], Colors.greenAccent.shade400),
                _buildFloatingField(Icons.verified_user, "Status", profile['status'], Colors.green.shade700),
                _buildFloatingField(Icons.calendar_today, "Joining Date", profile['joinDate'] != null ? profile['joinDate'].toString().split(' ')[0] : 'N/A', Colors.teal.shade700),

                const SizedBox(height: 30),

                // ✏️ Edit Profile Button (modern)
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                //     decoration: BoxDecoration(
                //       gradient: const LinearGradient(
                //         colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                //       ),
                //       borderRadius: BorderRadius.circular(25),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.green.withOpacity(0.4),
                //           blurRadius: 15,
                //           offset: const Offset(0, 8),
                //         ),
                //       ],
                //     ),
                //     child: const Text(
                //       "Edit Profile",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         letterSpacing: 1.1,
                //       ),
                //     ),
                //   ),
                // ),
                //
                // const SizedBox(height: 40),


              ],
            ),
          ),
        ),

//======End body part=====









    );
  }
}


//== End class ===




// 🔹 Floating field widget
Widget _buildFloatingField(IconData icon, String label, dynamic value, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500

                ),
              ),
              const SizedBox(height: 4),
              Text(
                value ?? 'N/A',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}




