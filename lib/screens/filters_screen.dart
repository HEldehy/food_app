import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool>currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  initState(){
     _glutenFree = widget.currentFilters['gluten'];
     _lactoseFree = widget.currentFilters['lactose'];
     _vegan = widget.currentFilters['vegan'];
     _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildSwitchTitle(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) =>
      SwitchListTile(
          title: Text(
            title,
          ),
          value: currentValue,
          subtitle: Text(description),
          onChanged: updateValue);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
      icon: Icon(Icons.save),
        onPressed:() {
            final selectedFilters={
            'gluten':_glutenFree,
            'lactose':_lactoseFree,
            'vegan':_vegan,
            'vegetarian':_vegetarian,
            };
             widget.saveFilters(selectedFilters);
            },
              )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTitle(
                  'Gluten-Free',
                  'Only Include Gluten-Free Meal', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchTitle(
                  'Lactose-Free',
                  'Only Include Lactose-Free Meal', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              buildSwitchTitle(
                  'Vegetarian',
                  'Only Include Vegetarian Meal', _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              buildSwitchTitle(
                  'Vegan',
                  'Only Include Vegan Meal', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
