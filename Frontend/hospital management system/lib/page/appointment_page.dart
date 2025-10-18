import 'package:flutter/material.dart';
import 'package:hospitalmanagementsystem/service/appointment_service.dart';
import '../entity/department.dart';
import '../entity/doctor_model.dart';
import '../entity/schedule_slot_model.dart';
import '../entity/appointment_model.dart';

class AppointmentPageWidget extends StatefulWidget {
  const AppointmentPageWidget({super.key});

  @override
  State<AppointmentPageWidget> createState() => _AppointmentPageWidgetState();
}

class _AppointmentPageWidgetState extends State<AppointmentPageWidget> {
  final HospitalService _service = HospitalService();

  List<Department> _departments = [];
  List<Doctor> _doctors = [];
  List<ScheduleSlot> _slots = [];

  int? _selectedDepartmentId;
  int? _selectedDoctorId;
  int? _selectedSlotId;

  final _patientNameController = TextEditingController();
  final _patientContactController = TextEditingController();
  final _reasonController = TextEditingController();

  bool _loadingDepartments = true;
  bool _loadingDoctors = false;
  bool _loadingSlots = false;

  @override
  void initState() {
    super.initState();
    _fetchDepartments();
  }

  void _fetchDepartments() async {
    setState(() => _loadingDepartments = true);
    try {
      _departments = await _service.getAllDepartments();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load departments: $e")));
    } finally {
      setState(() => _loadingDepartments = false);
    }
  }

  void _fetchDoctors(int departmentId) async {
    setState(() {
      _loadingDoctors = true;
      _doctors = [];
      _slots = [];
      _selectedDoctorId = null;
      _selectedSlotId = null;
    });
    try {
      _doctors = await _service.getDoctorsByDepartment(departmentId);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to load doctors: $e")));
    } finally {
      setState(() => _loadingDoctors = false);
    }
  }

  void _fetchSlots(int doctorId) async {
    setState(() {
      _loadingSlots = true;
      _slots = [];
      _selectedSlotId = null;
    });
    try {
      _slots = await _service.getAvailableSlotsByDoctor(doctorId);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to load slots: $e")));
    } finally {
      setState(() => _loadingSlots = false);
    }
  }

  void _bookAppointment() async {
    if (_selectedDepartmentId == null ||
        _selectedDoctorId == null ||
        _selectedSlotId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select all fields")));
      return;
    }

    final appointment = Appointment(
      patientName: _patientNameController.text,
      patientContact: _patientContactController.text,
      reason: _reasonController.text,
      departmentId: _selectedDepartmentId!,
      doctorId: _selectedDoctorId!,
      scheduleSlotId: _selectedSlotId!,
    );

    try {
      await _service.bookAppointment(appointment);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Appointment booked!")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to book: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _patientNameController,
              decoration: const InputDecoration(
                  labelText: "Patient Name", prefixIcon: Icon(Icons.person)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _patientContactController,
              decoration: const InputDecoration(
                  labelText: "Patient Contact", prefixIcon: Icon(Icons.phone)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reasonController,
              decoration: const InputDecoration(
                  labelText: "Reason", prefixIcon: Icon(Icons.note)),
            ),
            const SizedBox(height: 20),

            // Department Dropdown
            _loadingDepartments
                ? const CircularProgressIndicator()
                : DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                  labelText: "Select Department"),
              items: _departments
                  .map((d) => DropdownMenuItem(
                  value: d.id, child: Text(d.departmentName)))
                  .toList(),
              value: _selectedDepartmentId,
              onChanged: (value) {
                setState(() => _selectedDepartmentId = value);
                if (value != null) _fetchDoctors(value);
              },
            ),
            const SizedBox(height: 20),

            // Doctor Dropdown
            _loadingDoctors
                ? const CircularProgressIndicator()
                : DropdownButtonFormField<int>(
              decoration:
              const InputDecoration(labelText: "Select Doctor"),
              items: _doctors
                  .map((d) => DropdownMenuItem(
                  value: d.id, child: Text(d.name)))
                  .toList(),
              value: _selectedDoctorId,
              onChanged: (value) {
                setState(() => _selectedDoctorId = value);
                if (value != null) _fetchSlots(value);
              },
            ),
            const SizedBox(height: 20),

            // Slots Wrap
            _loadingSlots
                ? const CircularProgressIndicator()
                : Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _slots.map((slot) {
                final isSelected = slot.id == _selectedSlotId;
                return MouseRegion(
                  cursor: slot.isBooked
                      ? SystemMouseCursors.forbidden
                      : SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: slot.isBooked
                        ? null
                        : () => setState(() => _selectedSlotId = slot.id),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: slot.isBooked
                            ? Colors.grey.shade300
                            : isSelected
                            ? Colors.orange.shade400
                            : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                    
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medical_services,
                                  size: 16, color: Colors.grey.shade800),
                              const SizedBox(width: 5),
                              Text(slot.doctorName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.access_time,
                                  size: 14, color: Colors.grey.shade700),
                              const SizedBox(width: 4),
                              Text("${slot.startTime} - ${slot.endTime}",
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                          if (isSelected)
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Icon(Icons.check_circle,
                                  color: Colors.green.shade700),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // Book Appointment Button
            Center(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _bookAppointment,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade600,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade300,
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "Book Appointment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
