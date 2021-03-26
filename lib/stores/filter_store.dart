import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore(
      {this.maxCarbs = 50.0, this.maxFats = 50.0, this.maxCalories = 50.0});

  @observable
  double maxCarbs;

  @action
  void setMaxCarbs(double value) {
    maxCarbs = value;
  }

  @observable
  double maxCalories;

  @action
  void setMaxCalories(double value) {
    maxCalories = value;
  }

  @observable
  double maxFats;

  @action
  void setMaxFats(double value) {
    maxFats = value;
  }

  void setFilter() {
    Modular.get<RecipeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
        maxCalories: maxCalories, maxCarbs: maxCarbs, maxFats: maxFats);
  }
}
