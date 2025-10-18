import 'dart:convert';
import 'package:http/http.dart' as http;
import '../entity/medicine_stock_model.dart';

class MedicineStockService {
  final String baseUrl = "http://localhost:8080/api/stocks";

  Future<List<MedicineStock>> getAllStocks() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => MedicineStock.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load medicine stocks");
    }
  }
}
