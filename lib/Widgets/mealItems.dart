import 'package:flutter/material.dart';
import '../Screens/mealDetailsScreen.dart';

import '../models/mealsDataType.dart';

class MealItems extends StatelessWidget {
  String get complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simple';
        break;
      case (Complexity.Medium):
        return 'Medium';
        break;
      case (Complexity.Hard):
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case (Affordability.Affordable):
        return 'Affordable';
        break;
      case (Affordability.Pricey):
        return 'Pricey';
        break;
      case (Affordability.Luxurious):
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.routeNameMeals, arguments: id);
  }

  final String id;
  final String mealImage;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItems(
      {@required this.affordability,
      @required this.id,
      @required this.complexity,
      @required this.duration,
      @required this.mealImage,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    mealImage,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      width: 350,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ': $duration',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$complexityText')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.money_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
