import 'package:cook_box_recipes/models/ingredient_model.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:dio/dio.dart';

class RecipeRepository {
  final String _baseURL = "https://api.spoonacular.com";
  static const String API_KEY = "27f7b9425bf24169b69b3fe5492eb619";

  Future<List<Recipe>> getAllRecipes(Recipe filter, int offset) async {
    String endpoint = '$_baseURL/recipes/complexSearch?apiKey=$API_KEY';

    if (filter.title.trim().isNotEmpty) endpoint += '&query=${filter.title}';
    if (filter.carbs.trim().isNotEmpty) endpoint += '&maxCarbs=${filter.carbs}';
    if (filter.calories.trim().isNotEmpty)
      endpoint += '&maxCalories=${filter.calories}';
    if (filter.fat.trim().isNotEmpty) endpoint += '&maxFat=${filter.fat}';

    endpoint += '&offset=$offset&number=1';
    try {
      final response = await Dio().get(endpoint);

      return response.data['results']
          .map<Recipe>((receita) => Recipe.fromJson(receita))
          .toList();
    } on DioError {
      return Future.error('Error to return recipes');
    }
  }

  Future<Map> getRecipeInfo(int id) async {
    String endpoint =
        '$_baseURL/recipes/$id/information?apiKey=$API_KEY&includeNutrition=true';
    try {
      final response = await Dio().get(endpoint);
      return response.data;
    } on DioError {
      return Future.error('Error to return recipe infos');
    }
  }

  Future<List<Ingredient>> getRecipeIngredients(int id) async {
    String endpoint =
        '$_baseURL/recipes/$id/ingredientWidget.json?apiKey=$API_KEY';
    try {
      final response = await Dio().get(endpoint);
      return response.data
          .map<Ingredient>((ingredient) => Ingredient.fromJson(ingredient))
          .toList()
            ..sort((Ingredient a, Ingredient b) =>
                a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } on DioError {
      return Future.error('Error to return recipe ingredients');
    }
  }
}
