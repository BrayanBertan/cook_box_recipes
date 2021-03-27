import 'package:cook_box_recipes/models/nutrition_model.dart';

class Recipe {
  int id;
  String title;
  String summary;
  String image;
  int servings;
  int readyInMinutes;
  String diet;
  String cuisine;
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
      this.summary,
      this.diet,
      this.cuisine});

  factory Recipe.fromJson(Map<String, dynamic> obj) {
    return Recipe(
      id: obj['id'] ?? 0,
      summary: obj['summary'] ?? '',
      title: obj['title'],
      diet: obj['diets'].length > 0 ? obj['diets'][0] : '',
      cuisine: obj['cuisines'].length > 0 ? obj['cuisines'][0] : '',
      image: obj['image'] ??
          'https://archive.org/download/no-photo-available/no-photo-available.png',
      servings: obj['servings'] ?? 0,
      readyInMinutes: obj['readyInMinutes'] ?? 0,
      ingredients: obj['nutrition'] != null
          ? List<Nutrition>.from(obj['nutrition']['ingredients']
              .map((ingredient) => Nutrition.fromJson(ingredient)))
          : [],
      analyzedInstructions: obj['analyzedInstructions'] != null
          ? obj['analyzedInstructions'][0]['steps']
          : [],
      nutrients: obj['nutrition'] != null
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
