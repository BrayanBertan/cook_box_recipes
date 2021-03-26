import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SimilarRecipeItem extends StatelessWidget {
  Recipe recipe;
  SimilarRecipeItem({this.recipe});
  @override
  Widget build(BuildContext context) {
    final isSmallDevice = (ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet);
    return GestureDetector(
      onTap: () {
        Modular.to.navigate('/recipe', arguments: recipe);
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Image.network(
                  recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
              AutoSizeText(
                recipe.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 10,
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 12,
                          backgroundImage: NetworkImage(
                            'assets/images/timer.png',
                          ),
                        ),
                        title: AutoSizeText(
                          '${recipe.readyInMinutes} minutos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 10,
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            'assets/images/serving.png',
                          ),
                        ),
                        title: AutoSizeText(
                          '${recipe.servings} pessoas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
