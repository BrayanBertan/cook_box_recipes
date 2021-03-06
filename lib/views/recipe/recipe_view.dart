import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:cook_box_recipes/stores/favorites_store.dart';
import 'package:cook_box_recipes/views/recipe/widgets/recipe_view_top_big_devices.dart';
import 'package:cook_box_recipes/views/recipe/widgets/recipe_view_top_small_devices.dart';
import 'package:cook_box_recipes/views/recipe/widgets/similar_recipes_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipePage extends StatefulWidget {
  final Recipe obj;
  RecipePage({this.obj});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final FavoritesStore favoritesStore = Modular.get<FavoritesStore>();
  @override
  Widget build(BuildContext context) {
    final isSmallDevice = (ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet);
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          widget.obj.title,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400),
          maxLines: 1,
        ),
        actions: [
          IconButton(icon: Observer(
            builder: (context) {
              return Icon(favoritesStore.favorites.containsKey(widget.obj.id)
                  ? Icons.star
                  : Icons.star_border);
            },
          ), onPressed: () {
            favoritesStore.toggleFavorite(widget.obj);
          }),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isSmallDevice
                ? RecipeViewTopSmallDevices(
                    recipe: widget.obj,
                  )
                : RecipeViewTopBigDevices(
                    recipe: widget.obj,
                  ),
            AutoSizeText(
              'Nutrientes',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 3,
                  children: widget.obj.nutrients
                      .map((nutrient) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                  '${nutrient.name} ${nutrient.amount} ${nutrient.unit}'),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            AutoSizeText(
              'Ingredientes',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 8,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 3,
                  children: widget.obj.ingredients
                      .map((ingredients) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                  '${ingredients.name} ${ingredients.amount} ${ingredients.unit}'),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            AutoSizeText(
              'Modo de preparo',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 8,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.obj.analyzedInstructions
                        .map((instruction) => Text(
                            '${instruction['number']} - ${instruction['step']}'))
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            AutoSizeText(
              'Receitas similars',
              textAlign: TextAlign.left,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              maxLines: 1,
            ),
            SimilarRecipesGrid(
                diet: widget.obj.diets, cuisine: widget.obj.cuisines)
          ],
        ),
      ),
    );
  }
}
