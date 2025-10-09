class Test {
  final int id;
  final String testName;
  final double testPrice;

  Test({required this.id, required this.testName, required this.testPrice});

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      testName: json['testName'],
      testPrice: (json['testPrice'] as num).toDouble(),
    );
  }
}
