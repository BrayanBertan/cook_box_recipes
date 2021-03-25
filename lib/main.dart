import 'package:cook_box_recipes/app_modular/app_module.dart';
import 'package:cook_box_recipes/app_modular/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
