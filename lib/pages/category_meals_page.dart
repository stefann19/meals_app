import 'package:flutter/material.dart';
import 'package:max_guides/models/category.dart';
import 'package:max_guides/widgets/meal_item.dart';
import '../models/dummy_data.dart';
class CategoryMealsPage extends StatelessWidget {
  static const String routeName = "/category-meals";
  const CategoryMealsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String,Object>;
    final CategoryModel category = routeArgs['category'] as CategoryModel ;
    final mealsForCurrentCategory = DUMMY_MEALS.where((m) => m.categories.contains(category.id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(category.title),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(meal: mealsForCurrentCategory[index]);
      },itemCount: mealsForCurrentCategory.length,),
    );
  }
}
