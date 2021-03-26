import 'package:cook_box_recipes/models/nutrition_model.dart';

class Recipe {
  int id;
  String title;
  String summary;
  String image;
  int servings;
  int readyInMinutes;
  List<Nutrition> ingredients;
  List analyzedInstructions;
  List<Nutrition> nutrients;

  Recipe(
      {this.id,
      this.title,
      this.image,
      this.servings,
      this.readyInMinutes,
      this.ingredients,
      this.analyzedInstructions,
      this.nutrients,
      this.summary});

  factory Recipe.fromJson(Map<String, dynamic> obj) {
    return Recipe(
      id: obj['id'] ?? 0,
      summary: obj['summary'] ?? '',
      title: obj['title'],
      image: obj['image'] ?? '',
      servings: obj['servings'] ?? 0,
      readyInMinutes: obj['readyInMinutes'] ?? 0,
      ingredients: obj['nutrition']['ingredients'] != null
          ? List<Nutrition>.from(obj['nutrition']['ingredients']
              .map((ingredient) => Nutrition.fromJson(ingredient)))
          : [],
      analyzedInstructions: obj['analyzedInstructions'][0]['steps'] != null
          ? obj['analyzedInstructions'][0]['steps']
          : [],
      nutrients: obj['nutrition']['ingredients'] != null
          ? List<Nutrition>.from(obj['nutrition']['nutrients']
              .map((nutrient) => Nutrition.fromJson(nutrient)))
          : [],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': this.id,
      'title': this.title,
      'image': this.image,
    };
  }
}
