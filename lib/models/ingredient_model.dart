class Ingredient {
  String name;
  int value;
  String unit;
  String image;

  Ingredient({this.name, this.value, this.unit, this.image});

  factory Ingredient.fromJson(Map json) {
    return Ingredient(
      name: json['name'],
      image: json['image'],
      value: json['amount']['metric']['value'],
      unit: json['amount']['metric']['unit'],
    );
  }
}
