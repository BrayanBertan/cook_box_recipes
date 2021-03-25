class Ingredient {
  int id;
  String name;
  int amount;
  String units;

  Ingredient({this.id, this.name, this.amount, this.units});

  factory Ingredient.fromJson(Map json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      amount: json['measures']['metric']['amount'],
      units: json['units'],
    );
  }
}
