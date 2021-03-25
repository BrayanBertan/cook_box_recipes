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
    autorun((_) {
      if (offset == 0) isLoading(true);
      getAllRecipes();
    });
  }

  RecipeRepository recipeRepository;

  void resetPage() {
    offset = 0;
    recipeList.clear();
    lastPage = false;
  }

  @observable
  bool lastPage = false;

  @observable
  bool loading;

  @action
  void isLoading(bool value) => loading = value;

  @observable
  Recipe filter;

  @observable
  String search;

  @action
  void setSearch(String value) {
    resetPage();
    search = value;
  }

  @observable
  String maxCarbs;

  @action
  void setMaxCarbs(String value) {
    resetPage();
    maxCarbs = value;
  }

  @observable
  String maxCalories;

  @action
  void setMaxCalories(String value) {
    resetPage();
    maxCalories = value;
  }

  @observable
  String maxFats;

  @action
  void setMaxFats(String value) {
    resetPage();
    maxFats = value;
  }

  @observable
  int offset;

  @action
  void setOffset() => offset++;

  ObservableList<Recipe> recipeList = ObservableList<Recipe>();

  @action
  Future<void> getAllRecipes() async {
    try {
      filter = Recipe(
          title: search, calories: maxCalories, carbs: maxCarbs, fat: maxFats);
      final response = await recipeRepository.getAllRecipes(filter, offset);
      if (recipeList.length < 10) lastPage = true;
      recipeList.addAll(response);
    } catch (error) {
      print(error);
    }
    isLoading(false);
  }
}
