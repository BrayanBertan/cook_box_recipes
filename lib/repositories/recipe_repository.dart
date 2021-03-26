import 'package:cook_box_recipes/models/ingredient_model.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:cook_box_recipes/stores/filter_store.dart';
import 'package:dio/dio.dart';

class RecipeRepository {
  final String _baseURL = "https://api.spoonacular.com";
  static const String API_KEY = "ef4568fdba7e4de5aa90bdb7ecb9e934";

  Future<List<Recipe>> getAllRecipes(
      FilterStore filter, String search, int offset) async {
    String endpoint = '$_baseURL/recipes/complexSearch?apiKey=$API_KEY';

    if (search.trim().isNotEmpty) endpoint += '&query=${search}';
    if (filter.maxCarbs > 0) endpoint += '&maxCarbs=${filter.maxCarbs}';
    if (filter.maxCalories > 0)
      endpoint += '&maxCalories=${filter.maxCalories}';
    if (filter.maxFats > 0) endpoint += '&maxFat=${filter.maxFats}';

    endpoint += '&offset=$offset&number=1';
    // print('a$search');
    print(endpoint);
    return [];
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
