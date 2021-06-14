import 'package:myapp_3/Widgets/mealItems.dart';
import 'package:myapp_3/models/mealsDataType.dart';

import 'package:flutter/material.dart ';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meals> availabeMeals;

  CategoryMealsScreen(this.availabeMeals);
  static const routeName = '/category-mealsScreen';

  // final String selectedCategoryId;
  // final String selectedCategoryTitle;

  // CategoryMealsScreen(this.selectedCategoryId, this.selectedCategoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoriesId = routeArgs['id'];
    final categoriesTitle = routeArgs['title'];

    final categoryMeals = availabeMeals.where((meal) {
      return meal.categoryId.contains(categoriesId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          routeArgs['title'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              mealImage: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affodability,
              complexity: categoryMeals[index].mealComplexity,
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
