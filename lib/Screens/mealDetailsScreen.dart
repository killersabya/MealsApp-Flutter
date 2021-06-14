import 'package:flutter/material.dart';
import '../dummy.dart';

import '../models/mealsDataType.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function isMealFavorite;

  MealDetailsScreen(this.toggleFavorites, this.isMealFavorite);
  static const routeNameMeals = 'mealsItems - mealSelected';

  Widget subHeadContainer(BuildContext context, String any) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        any,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget subHeadContent(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.95,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealSelected = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorites(mealId),
      ),
      appBar: AppBar(
        title: Text(mealSelected.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.network(
                mealSelected.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            subHeadContainer(context, 'Ingredient'),
            subHeadContent(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(mealSelected.ingredients[index])),
                    color: Colors.purple[100],
                  ),
                ),
                itemCount: mealSelected.ingredients.length,
              ),
            ),
            subHeadContainer(context, 'Steps'),
            subHeadContent(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Divider(),
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(mealSelected.steps[index]),
                    ),
                  ],
                ),
                itemCount: mealSelected.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
