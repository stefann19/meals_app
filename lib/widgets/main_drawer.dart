import 'package:flutter/material.dart';
import 'package:max_guides/pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildItem(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size:26),
      title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24,fontWeight: FontWeight.bold),),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 128,width: double.infinity,
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          SizedBox(height: 20,),
          buildItem('Meals',Icons.restaurant, () => { Navigator.of(context).pushReplacementNamed('/')}),
          buildItem('Filters',Icons.settings, () => { Navigator.of(context).pushReplacementNamed(FiltersPage.routeName)}),
        ],
      ),
    );
  }
}
