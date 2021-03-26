import 'package:cook_box_recipes/models/ingredient_model.dart';

class Recipe {
  int id;
  String title;
  double calories;
  double carbs;
  double fat;
  String image;
  int servings;
  int readyInMinutes;
  List<Ingredient> ingredients;

  Recipe(
      {this.id,
      this.title,
      this.calories,
      this.carbs,
      this.fat,
      this.image,
      this.servings,
      this.readyInMinutes,
      this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> obj) {
    return Recipe(
            id: obj['id'] ?? 0,
            title: obj['title'],
            calories: obj['fat'] != null ? double.parse(obj['calories']) : 0.0,
            carbs: obj['fat'] != null ? double.parse(obj['carbs']) : 0.0,
            fat: obj['fat'] != null ? double.parse(obj['fat']) : 0.0,
            image: obj['image'] ?? '',
            servings: obj['servings'] ?? 0,
            readyInMinutes: obj['readyInMinutes'] ?? 0,
            ingredients: obj['ingredients']) ??
        [];
  }

  Map<String, dynamic> tojson() {
    return {
      'id': this.id,
      'title': this.title,
      'image': this.image,
    };
  }
}
