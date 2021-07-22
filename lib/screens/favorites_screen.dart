import 'package:flutter/material.dart';
import 'package:delimeal/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: favoriteMeals.length > 0
            ? Text('You have favorites')
            : Text('No favorites'));
  }
}
