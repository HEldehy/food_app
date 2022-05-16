import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20.0,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            indent: 5.0,
            endIndent: 5.0,
            thickness: 2.0,
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed('filters');
          }),
          Divider(
            indent: 5.0,
            endIndent: 5.0,
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
