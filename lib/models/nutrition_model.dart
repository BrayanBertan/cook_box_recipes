class Nutrition {
  String name;
  double amount;
  String unit;

  Nutrition({this.name, this.amount, this.unit});

  factory Nutrition.fromJson(Map json) {
    return Nutrition(
      name: json['name'] ?? '',
      amount: json['amount'] != null ? json['amount'] : 0.0,
      unit: json['unit'] ?? '',
    );
  }
}
