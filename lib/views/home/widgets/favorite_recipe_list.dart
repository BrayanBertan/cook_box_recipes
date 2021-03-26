import 'package:cook_box_recipes/stores/favorites_store.dart';
import 'package:cook_box_recipes/views/home/widgets/favorite_recipe_item.dart';
import 'package:cook_box_recipes/views/widgets/empty_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteRecipeList extends StatelessWidget {
  FavoritesStore favoritesStore = Modular.get<FavoritesStore>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(203, 100, 100, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 300,
      height: 500,
      child: Column(
        children: [
          Text(
            'Minhas receitas favoritas',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          favoritesStore.favorites.isEmpty
              ? EmptyListPage(
                  title: 'Você não possui receitas favoritadas',
                  fontSize: 30,
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: favoritesStore.favorites.length,
                    itemBuilder: (context, index) {
                      return FavoriteRecipeItem(
                          recipe: favoritesStore.favorites['index']);
                    },
                  ),
                )
        ],
      ),
    );
  }
}
