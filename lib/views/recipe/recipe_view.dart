import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class RecipePage extends StatelessWidget {
  final Recipe obj;
  RecipePage({this.obj});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  obj.image,
                  fit: BoxFit.cover,
                ),
              )),
              Expanded(flex: 2, child: Container())
            ],
          ),
          AutoSizeText(
            obj.title,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          Html(
            data: obj.summary,
          ),
          AutoSizeText(
            'Nutrients',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Card(
            elevation: 8,
            child: Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 3,
                children: obj.nutrients
                    .map((nutrient) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
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
          AutoSizeText(
            'Ingredientes',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Card(
            elevation: 8,
            child: Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 3,
                children: obj.ingredients
                    .map((ingredients) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
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
          AutoSizeText(
            'Modo de preparo',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 8,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: obj.analyzedInstructions
                      .map((instruction) => Text(
                          '${instruction['number']} - ${instruction['step']}'))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
