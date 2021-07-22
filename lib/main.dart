import 'package:delimeal/dummy_data.dart';
import 'package:delimeal/models/meal.dart';
import 'package:delimeal/screens/filter_screen.dart';
import 'package:delimeal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'package:delimeal/screens/category_meals_screen.dart';
import 'package:delimeal/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] && !meal.isGlutenFree) ||
            (_filters['vegan'] && !meal.isVegan) ||
            (_filters['lactose'] && !meal.isLactoseFree) ||
            (_filters['vegetarian'] && !meal.isVegetarian)) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleMeal(Meal toggledMeal) {
    print(toggledMeal.id);
    var exists = _favorites.length == 0
        ? null
        : _favorites.firstWhere((meal) => meal.id == toggledMeal.id);

    setState(() {
      if (exists == null) {
        _favorites.add(toggledMeal);
      } else {
        _favorites.removeWhere((element) => element.id == toggledMeal.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 250, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 20, 20, 1),
                ),
                headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                headline2: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                button: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
        ),
        routes: {
          '/': (ctx) => TabsScreen(_favorites),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleMeal),
          FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilter),
        });
  }
}
