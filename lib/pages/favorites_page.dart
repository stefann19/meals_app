import 'package:flutter/material.dart';
import 'package:max_guides/models/meal.dart';
import 'package:max_guides/widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.favoriteMeals}) : super(key: key);
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }

    return ListView.builder(itemBuilder: (ctx,index){
      return MealItem(meal: favoriteMeals[index],);
    },itemCount: favoriteMeals.length,);
  }
}
