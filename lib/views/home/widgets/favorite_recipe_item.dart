import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteRecipeItem extends StatelessWidget {
  Recipe recipe;
  FavoriteRecipeItem({this.recipe});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/recipe');
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.asset(
                      recipe.image,
                    )),
                AutoSizeText(
                  recipe.title,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
