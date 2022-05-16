import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modules/meal.dart';
import 'package:foodapp/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName='category_meals';
  final List<Meal>availableMeal;
  CategoryMealScreen(this.availableMeal);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}
class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal>displayMeals;
  @override

  void didChangeDependencies() {
    final routeArg=ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId=routeArg['id'];
    categoryTitle=routeArg['title'];
    displayMeals=widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(
        categoryTitle
      ),),
      body: ListView.builder(
        itemBuilder: (context,index){
          return MealItem(
            id: displayMeals[index].id,
            imageUrl:displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount: displayMeals.length,

      ),


    );
  }
}
