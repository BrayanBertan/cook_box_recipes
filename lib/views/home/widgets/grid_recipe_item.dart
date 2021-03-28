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
        Modular.to.pushNamed('/recipe', arguments: recipe);
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                recipe.image,
                fit: BoxFit.fill,
                height: isSmallDevice ? 125 : 150,
              ),
              AutoSizeText(
                recipe.title,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                          backgroundImage: AssetImage(
                            'assets/images/timer.png',
                          ),
                        ),
                        title: AutoSizeText(
                          isSmallDevice
                              ? '${recipe.readyInMinutes} min'
                              : '${recipe.readyInMinutes} minutos',
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
                        minLeadingWidth: 8,
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            'assets/images/serving.png',
                          ),
                        ),
                        title: AutoSizeText(
                          isSmallDevice
                              ? '${recipe.servings}'
                              : '${recipe.servings} pessoas',
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
