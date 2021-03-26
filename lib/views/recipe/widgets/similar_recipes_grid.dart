import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:cook_box_recipes/views/recipe/widgets/grid_similar_recipe_item.dart';
import 'package:cook_box_recipes/views/widgets/empty_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SimilarRecipesGrid extends StatefulWidget {
  String diet;
  String cuisine;
  SimilarRecipesGrid({this.diet, this.cuisine});
  @override
  _SimilarRecipesGridState createState() =>
      _SimilarRecipesGridState(diet: diet, cuisine: cuisine);
}

class _SimilarRecipesGridState extends State<SimilarRecipesGrid> {
  RecipeStore recipeStore = Modular.get<RecipeStore>();
  String diet;
  String cuisine;
  _SimilarRecipesGridState({this.diet, this.cuisine});
  @override
  void initState() {
    super.initState();
    recipeStore.getSimilarRecipes(diet, cuisine);
  }

  @override
  Widget build(BuildContext context) {
    RecipeStore recipeStore = Modular.get<RecipeStore>();
    final isSmallDevice = (ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet);
    return Observer(builder: (context) {
      return recipeStore.similarRecipesList.length == 0
          ? EmptyListPage(
              title: 'Nenhuma receita similar',
              fontSize: 50,
            )
          : GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(isSmallDevice ? 10 : 25),
              itemCount: recipeStore.similarRecipesList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                return SimilarRecipeItem(
                  recipe: recipeStore.similarRecipesList[index],
                );
              },
            );
    });
  }
}
