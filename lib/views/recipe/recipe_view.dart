import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final int id;
  RecipePage({this.id});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AutoSizeText(
            'COOKBOX',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          Row(
            children: [
              Expanded(child: Image.asset('assets/images/cooking.png')),
              Expanded(child: Container())
            ],
          ),
          AutoSizeText(
            'Informações',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Card(
            elevation: 8,
            child: Container(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 5,
                runSpacing: 2,
                children: [
                  Text(
                    'Calorias: 50',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  Text('Gordura: 30',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                  Text('Carboidratos: 9',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                  Text('Tempo de preparo: 50',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                  Text('Serve: 2',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w300)),
                ],
              ),
            ),
          ),
          AutoSizeText(
            'Ingredientes',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Card(
            elevation: 8,
            child: Row(
              children: [Text('aaaaaa')],
            ),
          ),
          AutoSizeText(
            'Modo de preparo',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
          Card(
            elevation: 8,
            child: Row(
              children: [Text('aaaaaa')],
            ),
          ),
        ],
      ),
    );
  }
}
