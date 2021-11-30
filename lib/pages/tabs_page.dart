import 'package:flutter/material.dart';
import 'package:max_guides/pages/categories_page.dart';
import 'package:max_guides/pages/favorites_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
            title:Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(icon:Icon(Icons.category), text:'Categories'),
                Tab(icon:Icon(Icons.star),text:'Favorites')
              ],
            )
        ),
        body: TabBarView(
          children: [
            CategoriesPage(),
            FavoritesPage()
          ],
        ),
      ),
      length: 2,
    );
  }
}
