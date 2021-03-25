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
            children: [
              AutoSizeText(
                'COOKBOX',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'Billabong',
                    fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
              AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    'assets/images/cooking.png',
                  )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tab(
                    icon: Image.asset(
                      'assets/images/timer.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AutoSizeText(
                    '50 minutos',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Tab(
                    icon: Image.asset(
                      'assets/images/serving.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AutoSizeText(
                    '3',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
