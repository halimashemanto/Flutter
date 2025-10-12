import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/entity/appointment_view_model.dart';
import 'package:hospitalmanagementsystem/service/appointment_view_service.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late Future<List<Appointment>> _appointmentsFuture;
  List<Appointment> _appointments = [];
  List<Appointment> _filteredAppointments = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _appointmentsFuture = AppointmentService().getAllAppointments();
    _appointmentsFuture.then((data) {
      setState(() {
        _appointments = data;
        _filteredAppointments = data;
      });
    });
  }

  void _filterAppointments(String query) {
    final filtered = _appointments.where((appointment) {
      return appointment.doctorName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredAppointments = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200, // light background
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "All Appointments",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.purple.shade700,
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _appointmentsFuture,
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
                "No Appointments Found",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ===== Search Field =====
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search by Doctor Name...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: _filterAppointments,
                  ),
                  const SizedBox(height: 16),

                  // ===== Appointment Cards =====
                  Expanded(
                    child: _filteredAppointments.isEmpty
                        ? const Center(
                      child: Text("No matching appointments",
                          style: TextStyle(color: Colors.black54)),
                    )
                        : SingleChildScrollView(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: _filteredAppointments
                            .map((appointment) =>
                            AppointmentCard(appointment: appointment))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;
  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white, // light card background
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Patient: ${appointment.patientName}",
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text("Contact: ${appointment.patientContact}",
              style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 4),
          Text("Reason: ${appointment.reason}",
              style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 4),
          Text("Doctor: ${appointment.doctorName} (${appointment.departmentName})",
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Text(
              "Slot: ${appointment.slotDate.day}/${appointment.slotDate.month}/${appointment.slotDate.year} "
                  "${appointment.slotStartTime} - ${appointment.slotEndTime}",
              style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
