import 'package:flutter/cupertino.dart';
import '../widgets/meal_item.dart';
import '../modules/meal.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal>favoriteMeal;
   FavoritesScreen(this.favoriteMeal);

  get displayMeals => null;
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text('You Have No Favorites yet -start adding some!'),
      );

    }else{

      return ListView.builder(
        itemBuilder: (context,index){
          return MealItem(
            id: favoriteMeal[index].id,
            imageUrl:favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,

      );

    }

  }
}
