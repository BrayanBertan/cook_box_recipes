import 'package:cook_box_recipes/views/home/widgets/search_input.dart';
import 'package:flutter/material.dart';

class CustomAppBarBigDevices extends StatelessWidget {
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
                  fontFamily: 'Billabong',
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      width: 225,
                      child: CustomSearchInput(),
                    ),
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
