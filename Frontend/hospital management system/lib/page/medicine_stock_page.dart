import 'package:flutter/material.dart';
import '../entity/medicine_stock_model.dart';
import '../service/medicine_stock_service.dart';

class MedicineStockPage extends StatefulWidget {
  final String? medicineName; // Optional filter argument

  const MedicineStockPage({super.key, this.medicineName});

  @override
  State<MedicineStockPage> createState() => _MedicineStockPageState();
}

class _MedicineStockPageState extends State<MedicineStockPage> {
  late Future<List<MedicineStock>> _stocks;

  @override
  void initState() {
    super.initState();
    _stocks = MedicineStockService().getAllStocks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.medicineName != null
              ? "Stock: ${widget.medicineName}"
              : "Pharmacy Stock",
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.1),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
      ),
      body: FutureBuilder<List<MedicineStock>>(
        future: _stocks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF38ef7d)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.redAccent)),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No Stocks Found",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            );
          } else {
            final stocks = snapshot.data!;
            final filteredStocks = widget.medicineName != null
                ? stocks
                .where((s) => s.medicineName
                .toLowerCase()
                .contains(widget.medicineName!.toLowerCase()))
                .toList()
                : stocks;

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F2027), Color(0xFF1C2833)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView.builder(
                itemCount: filteredStocks.length,
                itemBuilder: (context, index) {
                  final stock = filteredStocks[index];
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.05),
                          Colors.white.withOpacity(0.12)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Colors.white24, width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white12,
                          child: const Icon(
                            Icons.medical_services,
                            color: Colors.white70,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stock.medicineName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Batch: ${stock.batchNo} | Exp: ${stock.expiryDate.toString().split(' ')[0]}",
                                style: const TextStyle(
                                    color: Colors.cyanAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Quantity: ${stock.quantity} | Price: \$${stock.purchasePrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
                            ),
                          ),
                          child: const Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      backgroundColor: const Color(0xFF0F2027),
    );
  }
}
