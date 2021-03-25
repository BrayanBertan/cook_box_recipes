import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyListPage extends StatelessWidget {
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
            'OOPS! Mude os filtros para achar novas receitas',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontFamily: 'Billabong',
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
