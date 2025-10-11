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
    'https://images.pexels.com/photos/5452201/pexels-photo-5452201.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/5452191/pexels-photo-5452191.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/3825529/pexels-photo-3825529.jpeg?auto=compress&cs=tinysrgb&w=800',
  ];

  final List<String> carouselTexts = [
    "Advanced Surgery & Equipment",
    "Expert Doctors You Can Trust",
    "Caring Nurses and Staff",
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
      body: Stack(
        children: [
          // ===== Background =====
          SizedBox.expand(
            child: Image.network(
              carouselImages[_currentPage],
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),

          // ===== Scroll Content =====
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

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
                          color: Colors.tealAccent.shade100,
                          shadows: const [
                            Shadow(
                                color: Colors.black45,
                                offset: Offset(2, 2),
                                blurRadius: 4)
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Trust, Hope & Healing —"
                            " Your Health Our Priority",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              child: Text(
                                "Book Appointment",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.tealAccent.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 10,
                              shadowColor: Colors.tealAccent.shade400,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            icon: const Icon(Icons.login, color: Colors.white),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 18),
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
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

                const SizedBox(height: 50),

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
                      buildFeatureCard(Icons.local_hospital, "Departments", "Modern & well-equipped"),
                      buildFeatureCard(Icons.people, "Doctors", "Expert & friendly staff"),
                      buildFeatureCard(Icons.health_and_safety, "Services", "Full patient care"),
                      buildFeatureCard(Icons.healing, "Pharmacy", "Medicines available"),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // ===== Footer =====
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade800, Colors.teal.shade900],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Health Care Of Bangladesh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on, color: Colors.white70, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "Dhaka, Bangladesh",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone, color: Colors.white70, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "+880123456789",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.email, color: Colors.white70, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "info@healthcarebd.com",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "© 2025 Health Care Of Bangladesh. All rights reserved.",
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

  // ===== Carousel Card =====
  Widget buildCarouselCard(String url, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(url, fit: BoxFit.cover, width: double.infinity,alignment: Alignment.topCenter,),
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

  // ===== Feature Card =====
  Widget buildFeatureCard(IconData icon, String title, String subtitle) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 130,
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
              Icon(icon, size: 40, color: Colors.teal.shade700),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
