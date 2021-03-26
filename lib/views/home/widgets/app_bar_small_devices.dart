import 'package:cook_box_recipes/stores/home_store.dart';
import 'package:cook_box_recipes/views/home/widgets/filter_recipes.dart';
import 'package:cook_box_recipes/views/home/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBarSmallDevices extends StatelessWidget {
  HomeStore homeStore = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AppBar(
        title: Container(
          padding: EdgeInsets.all(25),
          width: double.infinity,
          child: homeStore.page == 1
              ? Row(
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
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: CustomSearchInput()),
                            IconButton(
                                iconSize: 30,
                                icon: Image.asset(
                                  'assets/images/search.png',
                                ),
                                onPressed: () {}),
                          ],
                        )),
                    Expanded(flex: 2, child: Container()),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => FilterRecipes());
                      },
                      icon: Image.asset(
                        'assets/images/filter.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
