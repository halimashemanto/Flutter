class MedicineStock {
  final int id;
  final String medicineName;
  final String batchNo;
  final String expiryDate;
  final int quantity;
  final double purchasePrice;

  MedicineStock({
    required this.id,
    required this.medicineName,
    required this.batchNo,
    required this.expiryDate,
    required this.quantity,
    required this.purchasePrice,
  });

  factory MedicineStock.fromJson(Map<String, dynamic> json) {
    return MedicineStock(
      id: json['id'],
      medicineName: json['medicine']['medicineName'] ?? '',
      batchNo: json['batchNo'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      quantity: json['quantity'] ?? 0,
      purchasePrice: (json['purchasePrice'] ?? 0).toDouble(),
    );
  }
}
