import 'dart:ui';
import 'package:flutter/material.dart';

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> facilities = [
      {
        "title": "24/7 Emergency Care",
        "desc": "Round-the-clock emergency unit with experienced doctors.",
        "img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqf8zJeY3JAAUzrSm3tozvPEDO-yHDGKYepA&s",
      },
      {
        "title": "Advanced Operation Theater",
        "desc": "Fully equipped modern operation theater ensuring patient safety.",
        "img": "https://media.gettyimages.com/id/501707914/photo/empty-hospital-operating-theatre-with-lighting-over-bed.jpg?s=612x612&w=gi&k=20&c=d6sZazqKr_UwzAVioLReqScK8PbSRsHMa9Fz5C0O7Hg=",
      },
      {
        "title": "Digital Laboratory",
        "desc": "Fast and accurate diagnostic tests with digital reporting.",
        "img": "https://images.pexels.com/photos/3825529/pexels-photo-3825529.jpeg?auto=compress&cs=tinysrgb&w=800",
      },
      {
        "title": "Pharmacy & Medicine Store",
        "desc": "All essential medicines available within the hospital premises.",
        "img": "https://images.pexels.com/photos/139398/thermometer-headache-pain-pills-139398.jpeg?cs=srgb&dl=pexels-pixabay-139398.jpg&fm=jpg",
      },
      {
        "title": "ICU & CCU Units",
        "desc": "Intensive and critical care units with advanced monitoring systems.",
        "img": "https://media.istockphoto.com/id/1466268284/photo/nurse-and-doctor-using-medical-ventilator-on-female-patient-while-cardiopulmonary.jpg?s=612x612&w=0&k=20&c=VuaBeqPY639IqCaP3RgcrS9PK3v6dfuQ6uJ_g-CqSpo=",
      },
      {
        "title": "Cafeteria & Waiting Lounge",
        "desc": "Comfortable spaces for patients and visitors to relax.",
        "img": "https://images.pexels.com/photos/4058218/pexels-photo-4058218.jpeg?auto=compress&cs=tinysrgb&w=800",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text("Our Facilities"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade700,
        elevation: 4,
      ),
      body: Stack(
        children: [
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
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.05)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Explore Our Premium Medical Facilities",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.purple.shade800,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(color: Colors.black26, offset: Offset(2, 2), blurRadius: 3)
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30), // screen sides e padding
                  child: const Text(
                    "We ensure world-class treatment & patient satisfaction.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center, // center alignment
                  ),
                ),

                const SizedBox(height: 30),

                // Facility Cards Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: facilities
                        .map((facility) => FacilityCard(
                      title: facility["title"]!,
                      description: facility["desc"]!,
                      imageUrl: facility["img"]!,
                    ))
                        .toList(),
                  ),
                ),

                const SizedBox(height: 50),

                // Footer Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.purple.shade900,
                  child: const Column(
                    children: [
                      Text(
                        "© 2025 Health Care of Bangladesh",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Excellence in Healthcare, Compassion in Service",
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FacilityCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  const FacilityCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends State<FacilityCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 280,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: _hovered ? Colors.purple.shade200 : Colors.black26,
              blurRadius: _hovered ? 15 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                widget.imageUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.purple.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.description,
                      style: const TextStyle(color: Colors.black54, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
