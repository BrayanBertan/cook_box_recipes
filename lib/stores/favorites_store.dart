import 'dart:convert';

import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

abstract class _FavoritesStore with Store {
  _FavoritesStore() {
    getAllFavorites();
  }
  Map<String, Recipe> favorites = {};

  void toggleFavorite(Recipe recipe) {
    if (favorites.containsKey(recipe.id))
      favorites.remove(recipe.id);
    else
      favorites['${recipe.id}'] = recipe;
    saveFavorite();
  }

  void saveFavorite() async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('favorites', json.encode(favorites.map((k, r) {
        return MapEntry(k, r.tojson());
      })));
    });
  }

  getAllFavorites() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.containsKey('favorites')) {
        favorites = json.decode(prefs.getString('favorites')).map((k, r) {
          return MapEntry(k, Recipe.fromJson(r));
        }).cast<String, Recipe>();
      }
    });
  }
}
