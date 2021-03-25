import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecipeItem extends StatelessWidget {
  Recipe recipe;
  RecipeItem({this.recipe});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/recipe');
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontFamily: 'Billabong',
                    fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.network(
                      recipe.image,
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
