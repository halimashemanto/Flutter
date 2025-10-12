import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/entity/doctor_model.dart';
import 'package:hospitalmanagementsystem/service/doctor_service.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

final String baseUrl = "http://localhost:8080/images/doctor/";

class _DoctorPageState extends State<DoctorPage> {
  late Future<List<Doctor>> _doctors;

  @override
  void initState() {
    super.initState();
    _doctors = DoctorService().getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Our Doctors",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade700,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: FutureBuilder<List<Doctor>>(
        future: _doctors,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.purple),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No Doctors Found",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            );
          } else {
            final doctors = snapshot.data!;
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: doctors
                      .map((doctor) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DoctorCard(doctor: doctor),
                  ))
                      .toList(),
                ),
              ),
            );
          }
        },
      ),



    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.purpleAccent.shade100, Colors.white.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Doctor photo
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purpleAccent,
            backgroundImage: (doctor.photo != null && doctor.photo!.isNotEmpty)
                ? NetworkImage("$baseUrl${doctor.photo!}")
                : const AssetImage('assets/images/default_avatar.jpg') as ImageProvider,
          ),

          const SizedBox(height: 12),

          // Name
          Text(
            doctor.name,
            style: const TextStyle(
                color: Colors.purple, fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),

          // Status
          Text(
            "Status: ${doctor.status}",
            style: const TextStyle(color: Colors.black, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
        // study
          Text(
            "Study: ${doctor.study}",
            style: const TextStyle(color: Colors.black, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // Email
          Text(
            "Email: ${doctor.email}",
            style: const TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),

          // Phone
          Text(
            "Phone: ${doctor.phone}",
            style: const TextStyle(color: Colors.black, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          // chamber
          Text(
            "Chamber: ${doctor.chamber}",
            style: const TextStyle(color: Colors.black, fontSize: 13),
            textAlign: TextAlign.center,
          ),


        ],
      ),
    );
  }
}
