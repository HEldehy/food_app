import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/widgets/category_item.dart';
import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: GridView(
          padding: EdgeInsets.all(25.0),
          children:DUMMY_CATEGORIES.map((catDate) =>
          CategoriesItem(catDate.id,catDate.title,catDate.color),
          ).toList(),
          gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),),
      ),
    );
  }
}
