import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/dummy.dart';
import 'package:flutter_application_1/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const RouteName = '/meal-detail';
  // ignore: non_constant_identifier_names
  Widget BuildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget BuildContainer(Widget abc) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(20)),
      height: 165,
      width: 350,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(6),
      child: abc,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('123${mealId}'),
      ),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
        ),
        BuildSectionTitle(context, 'Ingredients'),
        BuildContainer(
          ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Colors.yellow,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Text(
                  selectedMeal.ingredients[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
        BuildSectionTitle(context, 'Step'),
        BuildContainer(ListView.builder(
          itemBuilder: (ctx, index) => ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index + 1)}'),
            ),
            title: Text(selectedMeal.step[index]),
          ),
          itemCount: selectedMeal.step.length,
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
