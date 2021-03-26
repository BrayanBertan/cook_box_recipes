import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RecipeItem extends StatelessWidget {
  Recipe recipe;
  RecipeItem({this.recipe});
  @override
  Widget build(BuildContext context) {
    final isSmallDevice = (ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet);
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/recipe');
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              Container(
                child: AspectRatio(
                    aspectRatio: isSmallDevice ? 1.6 : 1.4,
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
