import 'package:flutter/material.dart';

class CustomSearchInput extends StatelessWidget {
  final TextEditingController searchController;
  CustomSearchInput({this.searchController});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Pesquise',
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: InputBorder.none,
      ),
    );
  }
}
