import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore(
      {this.maxCarbs = '50', this.maxFats = '50', this.maxCalories = '50'});

  @observable
  String maxCarbs;

  @action
  void setMaxCarbs(double value) {
    maxCarbs = value.toStringAsFixed(0);
  }

  @observable
  String maxCalories;

  @action
  void setMaxCalories(double value) {
    maxCalories = value.toStringAsFixed(0);
  }

  @observable
  String maxFats;

  @action
  void setMaxFats(double value) {
    maxFats = value.toStringAsFixed(0);
  }

  void setFilter() {
    Modular.get<RecipeStore>().setFilter(this);
  }

  FilterStore clone() {
    return FilterStore(
        maxCalories: maxCalories, maxCarbs: maxCarbs, maxFats: maxFats);
  }
}
