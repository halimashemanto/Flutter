import 'dart:ui';
import 'package:flutter/material.dart';

class ModernHomePage extends StatefulWidget {
  const ModernHomePage({super.key});

  @override
  State<ModernHomePage> createState() => _ModernHomePageState();
}

class _ModernHomePageState extends State<ModernHomePage> with TickerProviderStateMixin {
  int _currentPage = 0;
  late final PageController _pageController;

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  final List<String> carouselImages = [
  'https://static.vecteezy.com/system/resources/thumbnails/053/732/919/small/cutting-edge-medical-tools-showcased-in-a-modern-surgical-suite-design-photo.jpg',
    'https://images.pexels.com/photos/4173250/pexels-photo-4173250.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/3845764/pexels-photo-3845764.jpeg?auto=compress&cs=tinysrgb&w=800',
  ];

  final List<String> carouselTexts = [
    "Cutting-edge Medical Equipment",
    "Expert Doctors & Caring Staff",
    "Comprehensive Patient Care",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _startAutoSlide();
  }

  void _startAutoSlide() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted || !_pageController.hasClients) return;
      _currentPage = (_currentPage + 1) % carouselImages.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
      _fadeController.forward(from: 0);
      _startAutoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,

        elevation: 4,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/2966/2966485.png', // hospital logo
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          // TextButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/register');
          //   },
          //   child: const Text("Registration", style: TextStyle(color: Colors.white)),
          // ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/departments');
          //   },
          //   child: const Text("Departments", style: TextStyle(color: Colors.white)),
          // ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/doctors');
          //   },
          //   child: const Text("Doctors", style: TextStyle(color: Colors.white)),
          // ),
          //======apatoto off ei button a kono kaj nei tai


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade200, // button background
                  foregroundColor: Colors.purple.shade700, // text & icon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // rounded corners
                  ),
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],



      ),

      body: Stack(
        children: [
          // ===== Background Gradient =====
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
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),

          // ===== Scroll Content =====
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // ===== Hero Section =====
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        "Health Care of Bangladesh",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                          shadows: const [
                            Shadow(color: Colors.black38, offset: Offset(2, 2), blurRadius: 4)
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Trust, Hope & Healing — Your Health, Our Priority",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      Wrap(
                        spacing: 20,
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/appointment');
                            },
                            icon: const Icon(Icons.calendar_month_outlined),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                              child: Text("Book Appointment", style: TextStyle(fontSize: 16)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 10,
                              shadowColor: Colors.purple.shade400,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            icon: const Icon(Icons.login, color: Colors.white),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                              child: Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // ===== Carousel =====
                SizedBox(
                  height: 240,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: carouselImages.length,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double scale = 1.0;
                          if (_pageController.position.haveDimensions) {
                            scale = (_pageController.page! - index).abs() < 1
                                ? 1 - (_pageController.page! - index).abs() * 0.2
                                : 0.8;
                          }
                          return Transform.scale(
                            scale: scale,
                            child: child,
                          );
                        },
                        child: buildCarouselCard(carouselImages[index], carouselTexts[index]),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                // ===== Feature Cards =====
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      buildFeatureCard(Icons.local_hospital, "Departments", "Explore all"),
                      buildFeatureCard(Icons.people, "Doctors", "Expert & friendly staff"),
                      buildFeatureCard(Icons.app_registration, "Register", "Sign up today"),
                      buildFeatureCard(Icons.healing, "Facility", "Facilities available"),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // ===== Footer =====
                buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselCard(String url, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureCard(IconData icon, String title, String subtitle) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (title == "Departments") Navigator.pushNamed(context, '/departments');
          if (title == "Doctors") Navigator.pushNamed(context, '/doctors');
          if (title == "Register") Navigator.pushNamed(context, '/register');
          if (title == "Facility") Navigator.pushNamed(context, '/facility');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 140,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 8, offset: const Offset(0, 4)),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.purple.shade700),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
              const SizedBox(height: 5),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade800, Colors.purple.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Health Care Of Bangladesh",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text("Dhaka, Bangladesh", style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text("+880123456789", style: TextStyle(color: Colors.white70)),
              SizedBox(width: 10),
              Icon(Icons.email, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text("info@healthcarebd.com", style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "© 2025 Health Care Of Bangladesh. All rights reserved.",
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
