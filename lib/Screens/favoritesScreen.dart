import 'package:flutter/material.dart';
import 'package:myapp_3/models/mealsDataType.dart';
import '../Widgets/mealItems.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meals> favoritesMeals;

  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text('No Favorites added'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: favoritesMeals[index].id,
              title: favoritesMeals[index].title,
              mealImage: favoritesMeals[index].imageUrl,
              duration: favoritesMeals[index].duration,
              affordability: favoritesMeals[index].affodability,
              complexity: favoritesMeals[index].mealComplexity,
            );
          },
          itemCount: favoritesMeals.length);
    }
  }
}
