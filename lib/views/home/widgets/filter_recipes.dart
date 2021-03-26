import 'package:auto_size_text/auto_size_text.dart';
import 'package:cook_box_recipes/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FilterRecipes extends StatelessWidget {
  FilterStore filterStore = Modular.get<FilterStore>().clone();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              'Filtros',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Observer(builder: (_) {
              return ListTile(
                leading: Text(
                  'Carboidratos',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                title: Slider(
                  value: filterStore.maxCarbs,
                  min: 0,
                  max: 300,
                  onChanged: (double value) {
                    filterStore.setMaxCarbs(value);
                  },
                  label: filterStore.maxCarbs.toStringAsFixed(2),
                  divisions: 50,
                  activeColor: Color.fromRGBO(203, 100, 100, 1),
                ),
                trailing: Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/carbs.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(filterStore.maxCarbs.toStringAsFixed(2)),
                  ],
                ),
              );
            }),
            Observer(builder: (_) {
              return ListTile(
                leading: Text(
                  'Gorduras',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                title: Slider(
                  value: filterStore.maxFats,
                  min: 0,
                  max: 300,
                  onChanged: (double value) {
                    filterStore.setMaxFats(value);
                  },
                  label: filterStore.maxFats.toStringAsFixed(2),
                  divisions: 50,
                  activeColor: Color.fromRGBO(203, 100, 100, 1),
                ),
                trailing: Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/fat.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(filterStore.maxFats.toStringAsFixed(2)),
                  ],
                ),
              );
            }),
            Observer(builder: (_) {
              return ListTile(
                leading: Text(
                  'Calorias',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                title: Slider(
                  value: filterStore.maxCalories,
                  min: 0,
                  max: 300,
                  onChanged: (double value) {
                    filterStore.setMaxCalories(value);
                  },
                  label: filterStore.maxCalories.toStringAsFixed(2),
                  divisions: 50,
                  activeColor: Color.fromRGBO(203, 100, 100, 1),
                ),
                trailing: Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/calories.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(filterStore.maxCalories.toStringAsFixed(2)),
                  ],
                ),
              );
            }),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(203, 100, 100, 1),
                ),
                onPressed: () {
                  Modular.to.pop();
                  filterStore.setFilter();
                },
                child: Text('Filtrar')),
          ],
        ),
      ),
    );
  }
}
