import 'package:cook_box_recipes/repositories/recipe_repository.dart';
import 'package:cook_box_recipes/stores/home_store.dart';
import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RecipeRepository()),
    Bind.singleton((i) => HomeStore()),
    Bind((i) => RecipeStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
