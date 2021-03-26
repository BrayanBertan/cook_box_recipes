import 'package:cook_box_recipes/repositories/recipe_repository.dart';
import 'package:cook_box_recipes/stores/favorites_store.dart';
import 'package:cook_box_recipes/stores/filter_store.dart';
import 'package:cook_box_recipes/stores/home_store.dart';
import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:cook_box_recipes/views/home/home_view.dart';
import 'package:cook_box_recipes/views/splash_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RecipeRepository()),
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => RecipeStore()),
    Bind.singleton((i) => FilterStore()),
    Bind.singleton((i) => FavoritesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ChildRoute('/home', child: (_, __) => HomePage()),
  ];
}
