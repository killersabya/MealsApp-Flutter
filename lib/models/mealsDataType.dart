import 'package:flutter/material.dart';

enum Complexity { Simple, Medium, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meals {
  final String id;
  final List<String> categoryId;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final int duration;
  final List<String> steps;
  final Complexity mealComplexity;
  final Affordability affodability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVrgan;
  final bool isVEgetarian;

  const Meals(
      {@required this.affodability,
      @required this.categoryId,
      @required this.duration,
      @required this.id,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVEgetarian,
      @required this.isVrgan,
      @required this.mealComplexity,
      @required this.steps,
      @required this.title});
}
