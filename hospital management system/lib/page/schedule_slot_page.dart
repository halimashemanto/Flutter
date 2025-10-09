import 'package:flutter/material.dart';
import '../entity/schedule_slot_model.dart';
import '../service/schedule_slot_service.dart';

class ScheduleSlotPage extends StatefulWidget {
  const ScheduleSlotPage({super.key});

  @override
  State<ScheduleSlotPage> createState() => _ScheduleSlotPageState();
}

class _ScheduleSlotPageState extends State<ScheduleSlotPage> {
  final ScheduleSlotService _service = ScheduleSlotService();
  List<ScheduleSlot> _slots = [];
  bool _loading = false;
  int? _selectedDoctorId;

  // Example doctor list (can fetch from API)
  final List<Map<String, dynamic>> doctors = [
    {'id': 1, 'name': 'Dr. Smith'},
    {'id': 2, 'name': 'Dr. John'},
    {'id': 3, 'name': 'Dr. Alice'},
  ];

  void fetchSlots() async {
    if (_selectedDoctorId == null) return;
    setState(() => _loading = true);
    try {
      _slots = await _service.getSlotsByDoctor(_selectedDoctorId!);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Slots"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for doctor selection
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: "Select Doctor",
                border: OutlineInputBorder(),
              ),
              items: doctors
                  .map((doc) => DropdownMenuItem<int>(
                value: doc['id'],
                child: Text(doc['name']),
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
            _loading
                ? const CircularProgressIndicator()
                : Expanded(
              child: _slots.isEmpty
                  ? const Center(child: Text("No slots found"))
                  : ListView.builder(
                itemCount: _slots.length,
                itemBuilder: (context, index) {
                  final slot = _slots[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.schedule),
                      title: Text(
                          "${slot.date} | ${slot.startTime} - ${slot.endTime}"),
                      subtitle: Text(
                          "Doctor: ${slot.doctorName} | Booked: ${slot.isBooked ? "Yes" : "No"}"),
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
