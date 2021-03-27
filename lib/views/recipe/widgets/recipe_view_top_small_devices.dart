import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RecipeViewTopSmallDevices extends StatelessWidget {
  Recipe recipe;
  RecipeViewTopSmallDevices({this.recipe});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              recipe.image,
              fit: BoxFit.cover,
            ),
          ),
          AutoSizeText(
            recipe.title,
            minFontSize: 5,
            maxFontSize: 25,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none),
            maxLines: 5,
          ),
          Expanded(
            child: Html(
              data: recipe.summary,
            ),
          ),
        ],
      ),
    );
  }
}
