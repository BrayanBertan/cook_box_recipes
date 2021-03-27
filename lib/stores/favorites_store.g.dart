// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on _FavoritesStore, Store {
  final _$favoritesAtom = Atom(name: '_FavoritesStore.favorites');

  @override
  ObservableMap<int, Recipe> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableMap<int, Recipe> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$_FavoritesStoreActionController =
      ActionController(name: '_FavoritesStore');

  @override
  void toggleFavorite(Recipe recipe) {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
        name: '_FavoritesStore.toggleFavorite');
    try {
      return super.toggleFavorite(recipe);
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAllFavorites() {
    final _$actionInfo = _$_FavoritesStoreActionController.startAction(
        name: '_FavoritesStore.getAllFavorites');
    try {
      return super.getAllFavorites();
    } finally {
      _$_FavoritesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
