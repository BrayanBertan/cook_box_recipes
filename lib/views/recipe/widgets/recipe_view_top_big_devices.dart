import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RecipeViewTopBigDevices extends StatelessWidget {
  Recipe recipe;
  RecipeViewTopBigDevices({this.recipe});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(
            recipe.image,
            fit: BoxFit.cover,
          ),
        )),
        Expanded(
          child: Column(
            children: [
              AutoSizeText(
                recipe.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none),
                maxLines: 1,
              ),
              SizedBox(
                height: 15,
              ),
              Html(
                data: recipe.summary,
              ),
            ],
          ),
        )
      ],
    );
  }
}
