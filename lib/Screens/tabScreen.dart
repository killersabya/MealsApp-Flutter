import 'package:flutter/material.dart';
import 'package:myapp_3/Widgets/mindDrawer.dart';
import 'package:myapp_3/models/mealsDataType.dart';
import '../Screens/favoritesScreen.dart';
import '../Screens/categoryScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  void initState() {
    pages = [
      {
        'title': 'All Categories',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoritesScreen(widget.favoriteMeals),
      },
    ];

    super.initState();
  }

  int selectPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(pages[selectPageIndex]['title']),
      ),
      body: pages[selectPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black45,
        currentIndex: selectPageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColorLight,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: 'All Categories',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
