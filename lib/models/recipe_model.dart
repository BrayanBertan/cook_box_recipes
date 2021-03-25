import 'package:cook_box_recipes/models/ingredient_model.dart';

class Recipe {
  int id;
  String title;
  String calories;
  String carbs;
  String fat;
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

  factory Recipe.fromJson(Map obj) {
    return Recipe(
            id: obj['id'] ?? 0,
            title: obj['title'],
            calories: obj['calories'] ?? '',
            carbs: obj['carbs'] ?? '',
            fat: obj['fat'] ?? '',
            image: obj['image'],
            servings: obj['servings'] ?? 0,
            readyInMinutes: obj['readyInMinutes'] ?? 0,
            ingredients: obj['ingredients']) ??
        [];
  }
}
