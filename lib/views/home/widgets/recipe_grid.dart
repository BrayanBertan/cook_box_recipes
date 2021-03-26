import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:cook_box_recipes/views/home/widgets/grid_recipe_item.dart';
import 'package:cook_box_recipes/views/widgets/empty_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeStore recipeStore = Modular.get<RecipeStore>();
    final isMobile = ResponsiveWrapper.of(context).isMobile;
    return Observer(builder: (context) {
      return recipeStore.recipeList.length == 0 && !recipeStore.loading
          ? EmptyListPage()
          : GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(isMobile ? 10 : 25),
              itemCount: recipeStore.recipeList.length + 1,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                if (index < recipeStore.recipeList.length)
                  return RecipeItem(
                    recipe: recipeStore.recipeList[index],
                  );
                else if (!recipeStore.lastPage) {
                  recipeStore..setOffset();
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(203, 100, 100, 1)),
                  );
                } else {
                  return Container();
                }
              },
            );
    });
  }
}
