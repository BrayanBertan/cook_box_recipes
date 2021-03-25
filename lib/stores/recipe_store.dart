import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:cook_box_recipes/repositories/recipe_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  _RecipeStore() {
    recipeRepository = Modular.get<RecipeRepository>();
    loading = false;
    search = '';
    maxCarbs = '';
    maxCalories = '';
    maxFats = '';
    offset = 0;
    getAllRecipes();
  }

  RecipeRepository recipeRepository;

  @observable
  bool loading;

  @action
  void isLoading(bool value) => loading = value;

  @observable
  Recipe filter;

  @action
  void setFilter(Recipe value) => filter = value;

  @observable
  String search;

  @action
  void setSearch(String value) => search = value;

  @observable
  String maxCarbs;

  @action
  void setMaxCarbs(String value) => maxCarbs = value;

  @observable
  String maxCalories;

  @action
  void setMaxCalories(String value) => maxCalories = value;

  @observable
  String maxFats;

  @action
  void setMaxFats(String value) => maxFats = value;

  @observable
  int offset;

  @action
  void setOffset(int value) => offset = value;

  ObservableList<Recipe> recipeList = ObservableList<Recipe>();

  @action
  Future<void> getAllRecipes() async {
    try {
      if (offset == 0) recipeList.clear();
      filter = Recipe(
          title: search, calories: maxCalories, carbs: maxCarbs, fat: maxFats);
      final response = await recipeRepository.getAllRecipes(filter, offset);
      recipeList.addAll(response);
    } catch (error) {
      print(error);
    }
  }
}
