// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStore, Store {
  final _$maxCarbsAtom = Atom(name: '_FilterStore.maxCarbs');

  @override
  double get maxCarbs {
    _$maxCarbsAtom.reportRead();
    return super.maxCarbs;
  }

  @override
  set maxCarbs(double value) {
    _$maxCarbsAtom.reportWrite(value, super.maxCarbs, () {
      super.maxCarbs = value;
    });
  }

  final _$maxCaloriesAtom = Atom(name: '_FilterStore.maxCalories');

  @override
  double get maxCalories {
    _$maxCaloriesAtom.reportRead();
    return super.maxCalories;
  }

  @override
  set maxCalories(double value) {
    _$maxCaloriesAtom.reportWrite(value, super.maxCalories, () {
      super.maxCalories = value;
    });
  }

  final _$maxFatsAtom = Atom(name: '_FilterStore.maxFats');

  @override
  double get maxFats {
    _$maxFatsAtom.reportRead();
    return super.maxFats;
  }

  @override
  set maxFats(double value) {
    _$maxFatsAtom.reportWrite(value, super.maxFats, () {
      super.maxFats = value;
    });
  }

  final _$_FilterStoreActionController = ActionController(name: '_FilterStore');

  @override
  void setMaxCarbs(double value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setMaxCarbs');
    try {
      return super.setMaxCarbs(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxCalories(double value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setMaxCalories');
    try {
      return super.setMaxCalories(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxFats(double value) {
    final _$actionInfo = _$_FilterStoreActionController.startAction(
        name: '_FilterStore.setMaxFats');
    try {
      return super.setMaxFats(value);
    } finally {
      _$_FilterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
maxCarbs: ${maxCarbs},
maxCalories: ${maxCalories},
maxFats: ${maxFats}
    ''';
  }
}
