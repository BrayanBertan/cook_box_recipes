import 'package:cook_box_recipes/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomBottomNavigator extends StatelessWidget {
  HomeStore homeStore = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [Condition.smallerThan(name: DESKTOP)],
      replacement: Container(
        height: 56,
        color: Color.fromRGBO(203, 100, 100, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_screen_gif.gif',
            ),
            Text(
              'COOKBOX',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Billabong',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      child: BottomNavigationBar(
        onTap: (page) {
          homeStore.setPage(page);
        },
        currentIndex: homeStore.page,
        backgroundColor: Color.fromRGBO(203, 100, 100, 1),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/search.png',
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
            label: 'Descubra',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/my-recipe-book.png',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              label: 'Minhas receitas'),
        ],
      ),
    );
  }
}
