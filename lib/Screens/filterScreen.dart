import 'package:flutter/material.dart';
import 'package:myapp_3/Widgets/mindDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/setting';
  final Function setFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactocseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactocseFree = widget.currentFilters['lactose'];
    vegetarian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget switchFilterList(
      String text, bool filterName, String subTitle, Function update) {
    return SwitchListTile(
      value: filterName,
      activeColor: Theme.of(context).primaryColorLight,
      title: Text(text),
      onChanged: update,
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactocseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.setFilter(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
        title: Text(
          'Setting',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Customize your Meals ;) ',
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children: [
                switchFilterList(
                  'Gluten-Free',
                  glutenFree,
                  'Only Gluten Free',
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                switchFilterList(
                  'vegan',
                  vegan,
                  'Only Vegan Food',
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
                switchFilterList(
                  'Lactose-Free',
                  lactocseFree,
                  'Only Lactose Free food',
                  (newValue) {
                    setState(() {
                      lactocseFree = newValue;
                    });
                  },
                ),
                switchFilterList(
                  'Vegetarian',
                  vegetarian,
                  'Only Vegetarian food',
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
