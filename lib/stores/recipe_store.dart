import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:cook_box_recipes/repositories/recipe_repository.dart';
import 'package:cook_box_recipes/stores/filter_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'recipe_store.g.dart';

class RecipeStore = _RecipeStore with _$RecipeStore;

abstract class _RecipeStore with Store {
  _RecipeStore() {
    recipeRepository = Modular.get<RecipeRepository>();
    loading = false;
    search = '';
    offset = 0;
    autorun((_) async {
      if (offset == 0) isLoading(true);
      try {
        final response =
            await recipeRepository.getAllRecipes(filter, search, offset);
        if (recipeList.length < 10) lastPage = true;
        recipeList.addAll(response);
      } catch (error) {
        print(error);
      }
      isLoading(false);
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
  String search;

  @action
  void setSearch(String value) {
    resetPage();
    search = value;
  }

  @observable
  int offset;

  @action
  void setOffset() => offset++;

  ObservableList<Recipe> recipeList = ObservableList<Recipe>();

  @observable
  FilterStore filter = FilterStore();

  FilterStore get cloneFilter => filter.clone();

  @action
  void setFilter(FilterStore value) {
    resetPage();
    filter = value;
  }
}
