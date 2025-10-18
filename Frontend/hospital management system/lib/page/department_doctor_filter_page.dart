import 'package:flutter/material.dart';
import '../entity/department.dart';
import '../entity/doctor_model.dart';
import '../service/department_service.dart';
import '../service/doctor_service.dart';

class DepartmentDoctorPage extends StatefulWidget {
  const DepartmentDoctorPage({super.key});

  @override
  State<DepartmentDoctorPage> createState() => _DepartmentDoctorPageState();
}

class _DepartmentDoctorPageState extends State<DepartmentDoctorPage> {
  final DepartmentService _departmentService = DepartmentService();
  final DoctorService _doctorService = DoctorService();

  List<Department> _departments = [];
  List<Department> _filteredDepartments = [];
  List<Doctor> _doctors = [];

  bool _deptLoading = false;
  bool _doctorLoading = false;
  int? _selectedDepartmentId;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDepartments();
  }

  void fetchDepartments() async {
    setState(() => _deptLoading = true);
    try {
      final departments = await _departmentService.getAllDepartments();
      setState(() {
        _departments = departments;
        _filteredDepartments = departments;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load departments: $e')),
      );
    } finally {
      setState(() => _deptLoading = false);
    }
  }

  void _filterDepartments(String query) {
    final filtered = _departments
        .where((dept) => dept.departmentName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      _filteredDepartments = filtered;
    });
  }

  void fetchDoctorsByDepartment(int departmentId) async {
    setState(() {
      _doctorLoading = true;
      _doctors = [];
      _selectedDepartmentId = departmentId;
    });
    try {
      _doctors = await _doctorService.getDoctorsByDepartment(departmentId);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load doctors: $e")),
      );
    } finally {
      setState(() => _doctorLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          _selectedDepartmentId == null ? "Departments" : "Doctors",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: _selectedDepartmentId != null
            ? IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            setState(() {
              _selectedDepartmentId = null;
              _doctors.clear();
              _searchController.clear();
              _filteredDepartments = _departments;
            });
          },
        )
            : null,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _deptLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : _selectedDepartmentId == null
            ? _buildDepartmentView()
            : _doctorLoading
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : _buildDoctorCards(),
      ),
    );
  }

  // ----------------- Department Grid View -----------------
  Widget _buildDepartmentView() {
    return Column(
      children: [
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            onChanged: _filterDepartments,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              hintText: "Search Department...",
              hintStyle: const TextStyle(color: Colors.black45),
              prefixIcon: const Icon(Icons.search, color: Colors.black45),
              filled: true,
              fillColor: Colors.white.withOpacity(0.9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _filteredDepartments.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 140,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              final dept = _filteredDepartments[index];
              return InkWell(
                onTap: () => fetchDoctorsByDepartment(dept.id),
                borderRadius: BorderRadius.circular(20),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Colors.white, Color(0xFFd9b3ff)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.local_hospital_rounded,
                          color: Colors.purple, size: 48),
                      const SizedBox(height: 8),
                      Text(
                        dept.departmentName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ----------------- Doctor Cards -----------------
  Widget _buildDoctorCards() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
      itemCount: _doctors.length,
      itemBuilder: (context, index) {
        final doc = _doctors[index];
        return DoctorCard(doctor: doc);
      },
    );
  }
}

// ----------------- Doctor Card -----------------
class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final String baseUrl = "http://localhost:8080/images/doctor/";
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFf3e5f5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.purple.shade50,
            backgroundImage: (doctor.photo != null && doctor.photo!.isNotEmpty)
                ? NetworkImage("$baseUrl${doctor.photo}")
                : const AssetImage('assets/images/default_avatar.jpg') as ImageProvider,
          ),
          const SizedBox(height: 12),
          Text(
            doctor.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.purple),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text("Status: ${doctor.status}", style: const TextStyle(color: Colors.black)),
          Text("Study: ${doctor.study}", style: const TextStyle(color: Colors.black)),
          Text("Email: ${doctor.email}", style: const TextStyle(color: Colors.black, fontSize: 12)),
          Text("Phone: ${doctor.phone}", style: const TextStyle(color: Colors.black, fontSize: 12)),
          Text("Chamber: ${doctor.chamber}", style: const TextStyle(color: Colors.black, fontSize: 13)),
        ],
      ),
    );
  }
}
