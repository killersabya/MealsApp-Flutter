import 'package:flutter/material.dart';
import 'package:myapp_3/dummy.dart';
import './Screens/filterScreen.dart';
import './models/mealsDataType.dart';

import './Screens/tabScreen.dart';
import '../Screens/mealDetailsScreen.dart';

import './Screens/categoryMealsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meals> avilableMeals = DUMMY_MEALS;
  List<Meals> favoriteMeals = [];

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      avilableMeals = DUMMY_MEALS.where((element) {
        if (filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !element.isVrgan) {
          return false;
        }
        if (filters['vegetarian'] && !element.isVEgetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  void toggleFavorites(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: TabsScreen(),
      debugShowCheckedModeBanner: false,
      title: 'DelMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(avilableMeals),
        MealDetailsScreen.routeNameMeals: (ctx) =>
            MealDetailsScreen(toggleFavorites, isMealFavorite)
      },
    );
  }
}
