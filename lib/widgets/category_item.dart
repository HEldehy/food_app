import 'package:flutter/material.dart';
import 'package:foodapp/screens/category_meal_screen.dart';
class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoriesItem(this.id, this.title, this.color);
  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName,
    arguments: {
      'id':id,
      'title':title,
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
