import 'package:flutter/material.dart';
import 'package:flutter_application_1/category_meals_screen.dart';
import 'package:flutter_application_1/dummy.dart';
import 'package:flutter_application_1/filters_screen.dart';
import 'package:flutter_application_1/tab_screen.dart';
import './Categories_screen.dart';
import './meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lacose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filtersdata) {
    setState(() {
      _filters = filtersdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demi Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed'))),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        '/category_meal': (ctx) => CateloryMealsScreen(),
        MealDetailScreen.RouteName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters),
      },
      onGenerateRoute: (settings) {
        print("object");
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print("myname");
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
