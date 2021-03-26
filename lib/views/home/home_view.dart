import 'package:cook_box_recipes/stores/home_store.dart';
import 'package:cook_box_recipes/views/home/widgets/app_bar_big_devices.dart';
import 'package:cook_box_recipes/views/home/widgets/app_bar_small_devices.dart';
import 'package:cook_box_recipes/views/home/widgets/custom_bottom_navigator.dart';
import 'package:cook_box_recipes/views/home/widgets/favorite_recipe_list.dart';
import 'package:cook_box_recipes/views/home/widgets/recipe_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore homeStore = Modular.get<HomeStore>();
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    reaction((_) => homeStore.page, (page) {
      pageController.jumpToPage(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmallDevice = (ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: isSmallDevice
            ? CustomAppBarSmallDevices()
            : CustomAppBarBigDevices(),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: isSmallDevice
                ? Observer(builder: (context) {
                    return PageView(
                      controller: pageController,
                      children: [RecipeGrid(), FavoriteRecipeList()],
                    );
                  })
                : Row(
                    children: [
                      Expanded(child: RecipeGrid()),
                      FavoriteRecipeList()
                    ],
                  )),
      ),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}
