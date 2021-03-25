import 'package:cook_box_recipes/views/home/app_bar/search_input.dart';
import 'package:flutter/material.dart';

class CustomAppBarSmallDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        child: Row(
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
                        iconSize: 40,
                        icon: Image.asset(
                          'assets/images/search.png',
                        ),
                        onPressed: () {}),
                  ],
                )),
            Expanded(flex: 2, child: Container()),
            Tab(
              icon: Image.asset(
                'assets/images/filter.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
