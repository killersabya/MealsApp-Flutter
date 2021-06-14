import 'package:flutter/material.dart';
import 'package:myapp_3/Screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorLight,
            child: Text(
              'Cooking Up!!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            leading: Icon(
              Icons.restaurant,
              size: 24,
            ),
            title: Text(
              'Meals',
              style: TextStyle(fontFamily: 'RobotoCondence', fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/setting');
            },
            leading: Icon(
              Icons.settings,
              size: 20,
            ),
            title: Text(
              'Setting',
              style: TextStyle(
                  fontFamily: 'RobotoCondence',
                  color: Colors.grey[600],
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
