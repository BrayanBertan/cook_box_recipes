import 'package:cook_box_recipes/views/home/widgets/favorite_recipe_item.dart';
import 'package:flutter/material.dart';

class MyRecipeList extends StatelessWidget {
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
            'Minhas receitas',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return MyRecipeItem();
              },
            ),
          )
        ],
      ),
    );
  }
}
