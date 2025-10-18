import 'package:flutter/material.dart';
import '../entity/test_model.dart';
import '../service/test_service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Future<List<Test>> _tests;
  List<Test> _allTests = []; // all tests store korar jnno
  List<Test> _filteredTests = []; // filtered list
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tests = TestService().getAllTests();
    _tests.then((value) {
      setState(() {
        _allTests = value;
        _filteredTests = value;
      });
    });

    _searchController.addListener(() {
      _filterTests();
    });
  }

  void _filterTests() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTests = _allTests.where((test) {
        return test.testName.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "All Tests",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search Tests...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _filteredTests.isEmpty
            ? const Center(
          child: Text(
            "No Tests Found",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        )
            : ListView.builder(
          itemCount: _filteredTests.length,
          itemBuilder: (context, index) {
            final test = _filteredTests[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.medical_services,
                    color: Colors.blueAccent),
                title: Text(test.testName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Text("\$${test.testPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFF0F2027),
    );
  }
}
