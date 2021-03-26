import 'package:cook_box_recipes/stores/recipe_store.dart';
import 'package:cook_box_recipes/views/home/widgets/filter_recipes.dart';
import 'package:cook_box_recipes/views/home/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBarBigDevices extends StatelessWidget {
  RecipeStore recipeStore = Modular.get<RecipeStore>();
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              'assets/images/splash_screen_gif.gif',
              width: 150,
            ),
            Text(
              'COOKBOX',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 225,
                      child:
                          CustomSearchInput(searchController: searchController),
                    ),
                    IconButton(
                        iconSize: 30,
                        icon: Image.asset(
                          'assets/images/search.png',
                        ),
                        onPressed: () {
                          recipeStore.setSearch(searchController.text);
                        }),
                  ],
                )),
            Expanded(flex: 2, child: Container()),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => FilterRecipes());
              },
              icon: Image.asset(
                'assets/images/filter.png',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
