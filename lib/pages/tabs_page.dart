import 'package:flutter/material.dart';
import 'package:max_guides/models/meal.dart';
import 'package:max_guides/pages/categories_page.dart';
import 'package:max_guides/pages/favorites_page.dart';
import 'package:max_guides/widgets/main_drawer.dart';
class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  List<Map<String,dynamic>> pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState(){
    pages = [
      {'title':'Categories', 'page':CategoriesPage()},
      {'title':'Favorites', 'page':FavoritesPage(favoriteMeals: widget.favoriteMeals)},
    ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(

      ),
      body: pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label:'Categories'
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label:'Favorites'
          )
        ],
      ),
    );
  }
}
