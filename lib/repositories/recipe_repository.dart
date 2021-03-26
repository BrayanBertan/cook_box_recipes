import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:cook_box_recipes/stores/filter_store.dart';
import 'package:dio/dio.dart';

class RecipeRepository {
  final String _baseURL = "https://api.spoonacular.com";
  static const String API_KEY = "2a77bc60a40b48cb9f273c2825118f9b";

  Future<List<Recipe>> getAllRecipes(
      FilterStore filter, String search, int offset) async {
    String endpoint = '$_baseURL/recipes/complexSearch?apiKey=$API_KEY';

    if (search.trim().isNotEmpty) endpoint += '&query=${search}';
    if (filter.maxCarbs > 0) endpoint += '&maxCarbs=${filter.maxCarbs}';
    if (filter.maxCalories > 0)
      endpoint += '&maxCalories=${filter.maxCalories}';
    if (filter.maxFats > 0) endpoint += '&maxFat=${filter.maxFats}';

    endpoint += '&addRecipeNutrition=true&offset=$offset&number=1';
    //  return [];
    try {
      final response = await Dio().get(endpoint);
      return response.data['results'].map<Recipe>((receita) {
        return Recipe.fromJson(receita);
      }).toList();
    } on DioError {
      return Future.error('Error to return recipes');
    }
  }

  Future<List<Recipe>> getSimilarRecipes(String diet, String cuisine) async {
    String endpoint = '$_baseURL/recipes/random?apiKey=$API_KEY&number=3';
    print(endpoint);
    if (diet.trim().isNotEmpty) endpoint += '&diet=$diet';
    if (cuisine.trim().isNotEmpty) endpoint += '&cuisine=$cuisine';
    try {
      final response = await Dio().get(endpoint);
      return response.data['recipes'].map<Recipe>((receita) {
        return Recipe.fromJson(receita);
      }).toList();
    } on DioError {
      return Future.error('Error to return recipes');
    }
  }
}
