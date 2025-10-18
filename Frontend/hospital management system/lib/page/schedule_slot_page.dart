import 'package:flutter/material.dart';
import '../entity/schedule_slot_model.dart';
import '../entity/doctor_model.dart';
import '../service/schedule_slot_service.dart';
import '../service/doctor_service.dart';

class ScheduleSlotPage extends StatefulWidget {
  const ScheduleSlotPage({super.key});

  @override
  State<ScheduleSlotPage> createState() => _ScheduleSlotPageState();
}

class _ScheduleSlotPageState extends State<ScheduleSlotPage> {
  final ScheduleSlotService _scheduleService = ScheduleSlotService();
  final DoctorService _doctorService = DoctorService();

  List<ScheduleSlot> _slots = [];
  List<Doctor> _doctors = [];
  bool _loading = false;
  bool _doctorLoading = false;
  int? _selectedDoctorId;

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  /// ✅ Fetch all doctors from API dynamically
  void fetchDoctors() async {
    setState(() => _doctorLoading = true);
    try {
      final doctors = await _doctorService.getAllDoctors();
      setState(() {
        _doctors = doctors;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to load doctors: $e')));
    } finally {
      setState(() => _doctorLoading = false);
    }
  }

  /// ✅ Fetch schedule slots for selected doctor
  void fetchSlots() async {
    if (_selectedDoctorId == null) return;
    setState(() => _loading = true);
    try {
      _slots = await _scheduleService.getSlotsByDoctor(_selectedDoctorId!);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Schedule Slots"),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Doctor Dropdown
            _doctorLoading
                ? const Center(child: CircularProgressIndicator())
                : DropdownButtonFormField<int>(
              decoration: InputDecoration(
                labelText: "Select Doctor",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: _doctors
                  .map((doc) => DropdownMenuItem<int>(
                value: doc.id,
                child: Text(doc.name),
              ))
                  .toList(),
              value: _selectedDoctorId,
              onChanged: (value) {
                setState(() {
                  _selectedDoctorId = value;
                  _slots = [];
                });
                fetchSlots();
              },
            ),

            const SizedBox(height: 20),

            // Schedule List
            _loading
                ? const Expanded(
                child: Center(child: CircularProgressIndicator()))
                : Expanded(
              child: _slots.isEmpty
                  ? const Center(child: Text("No slots found"))
                  : ListView.builder(
                itemCount: _slots.length,
                itemBuilder: (context, index) {
                  final slot = _slots[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    margin:
                    const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: slot.isBooked
                          ? Colors.red.shade50
                          : Colors.green.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: slot.isBooked
                            ? Colors.redAccent
                            : Colors.green,
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              slot.doctorName ?? "Unknown Doctor",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () {
                                    // TODO: implement edit logic
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    // TODO: implement delete logic
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                size: 18, color: Colors.black54),
                            const SizedBox(width: 6),
                            Text("Date: ${slot.date}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                size: 18, color: Colors.black54),
                            const SizedBox(width: 6),
                            Text(
                                "Time: ${slot.startTime} - ${slot.endTime}"),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.check_circle,
                                size: 18, color: Colors.black54),
                            const SizedBox(width: 6),
                            Text(
                              "Status: ${slot.isBooked ? "Booked" : "Available"}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: slot.isBooked ? Colors.redAccent : Colors.green.shade800,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
