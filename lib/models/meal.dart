import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  @required
  final String id;
  @required
  final String title;
  @required
  final List<String> categories;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
    this.id,
    this.title,
    this.categories,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.complexity,
    this.affordability,
  });
}
