import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/modules/meal.dart';
import 'package:foodapp/screens/favourit_screen.dart';
import 'package:foodapp/widgets/main_drawer.dart';
import 'categorey_screen.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeal;
  const TabsScreen(this.favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex=0;

   List<Map<String,Object>> pages;
   void initState(){
     pages  =[
     {'page' :CategoriesScreen() ,
     'title' : 'categories',
     },
     {
     'page' :FavoritesScreen(widget.favoriteMeal) ,
     'title' : 'Your Favorites',
     }
     ];
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] ),
      ),
      body:pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPageIndex,
        onTap: (index){
          setState(() {
            selectedPageIndex=index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category,
          ),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star,
          ),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer: MainDrawer(

      ),

    );


  }
}
