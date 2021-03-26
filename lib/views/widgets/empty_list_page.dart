import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyListPage extends StatelessWidget {
  String title;
  double fontSize;
  EmptyListPage({this.title, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Image.asset('assets/images/empty-list.png'),
          ),
          AutoSizeText(
            'OOPS! $title',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
