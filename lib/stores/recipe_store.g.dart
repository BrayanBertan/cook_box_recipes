// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecipeStore on _RecipeStore, Store {
  final _$lastPageAtom = Atom(name: '_RecipeStore.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RecipeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$filterAtom = Atom(name: '_RecipeStore.filter');

  @override
  Recipe get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(Recipe value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$searchAtom = Atom(name: '_RecipeStore.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$maxCarbsAtom = Atom(name: '_RecipeStore.maxCarbs');

  @override
  String get maxCarbs {
    _$maxCarbsAtom.reportRead();
    return super.maxCarbs;
  }

  @override
  set maxCarbs(String value) {
    _$maxCarbsAtom.reportWrite(value, super.maxCarbs, () {
      super.maxCarbs = value;
    });
  }

  final _$maxCaloriesAtom = Atom(name: '_RecipeStore.maxCalories');

  @override
  String get maxCalories {
    _$maxCaloriesAtom.reportRead();
    return super.maxCalories;
  }

  @override
  set maxCalories(String value) {
    _$maxCaloriesAtom.reportWrite(value, super.maxCalories, () {
      super.maxCalories = value;
    });
  }

  final _$maxFatsAtom = Atom(name: '_RecipeStore.maxFats');

  @override
  String get maxFats {
    _$maxFatsAtom.reportRead();
    return super.maxFats;
  }

  @override
  set maxFats(String value) {
    _$maxFatsAtom.reportWrite(value, super.maxFats, () {
      super.maxFats = value;
    });
  }

  final _$offsetAtom = Atom(name: '_RecipeStore.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$getAllRecipesAsyncAction = AsyncAction('_RecipeStore.getAllRecipes');

  @override
  Future<void> getAllRecipes() {
    return _$getAllRecipesAsyncAction.run(() => super.getAllRecipes());
  }

  final _$_RecipeStoreActionController = ActionController(name: '_RecipeStore');

  @override
  void isLoading(bool value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.isLoading');
    try {
      return super.isLoading(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxCarbs(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setMaxCarbs');
    try {
      return super.setMaxCarbs(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxCalories(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setMaxCalories');
    try {
      return super.setMaxCalories(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxFats(String value) {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setMaxFats');
    try {
      return super.setMaxFats(value);
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOffset() {
    final _$actionInfo = _$_RecipeStoreActionController.startAction(
        name: '_RecipeStore.setOffset');
    try {
      return super.setOffset();
    } finally {
      _$_RecipeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lastPage: ${lastPage},
loading: ${loading},
filter: ${filter},
search: ${search},
maxCarbs: ${maxCarbs},
maxCalories: ${maxCalories},
maxFats: ${maxFats},
offset: ${offset}
    ''';
  }
}
