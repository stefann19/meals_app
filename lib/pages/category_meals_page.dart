import 'package:flutter/material.dart';
import 'package:max_guides/models/category.dart';
import 'package:max_guides/models/meal.dart';
import 'package:max_guides/widgets/meal_item.dart';
import '../models/dummy_data.dart';
class CategoryMealsPage extends StatefulWidget {
  static const String routeName = "/category-meals";
  const CategoryMealsPage({Key? key}) : super(key: key);

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle = '';
  List<Meal> displayedMeals = <Meal>[];
  bool _loadedInitData = false;
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((e) => e.id == mealId);
    });
  }

  @override
  void didChangeDependencies(){
    if(!_loadedInitData){
      final routeArgs = (ModalRoute.of(context)?.settings.arguments ?? {'category':DUMMY_CATEGORIES.first}) as Map<String,Object>;
      final CategoryModel category = routeArgs['category'] as CategoryModel ;
      categoryTitle = category.title;
      displayedMeals = DUMMY_MEALS.where((m) => m.categories.contains(category.id)).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(meal: displayedMeals[index], removeMeal: _removeMeal,);
      },itemCount: displayedMeals.length,),
    );
  }
}
