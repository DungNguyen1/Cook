import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'dummy.dart';
import 'meal_item.dart';

class CateloryMealsScreen extends StatefulWidget {
  @override
  State<CateloryMealsScreen> createState() => _CateloryMealsScreenState();
}

class _CateloryMealsScreenState extends State<CateloryMealsScreen> {
  late String cateloryTitle;
  late List<Meal> displayedMeals;
  bool loaderInitData = false;
  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!loaderInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      cateloryTitle = routeArgs['title'].toString();
      final cateloryID = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(cateloryID);
      }).toList();
      loaderInitData = true;
    }
    // TODO: implement initState
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cateloryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedMeals[index].id,
                affordability: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity,
                duration: displayedMeals[index].duration,
                imageUrl: displayedMeals[index].imageUrl,
                title: displayedMeals[index].title,
                Remove: _removeMeal);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
