import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_guides/models/dummy_data.dart';
import 'package:max_guides/pages/category_meals_page.dart';
import 'package:max_guides/pages/filters_page.dart';
import 'package:max_guides/pages/meal_detail_page.dart';
import 'package:max_guides/pages/tabs_page.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] == true && ! meal.isGlutenFree)return false;
        if(_filters['lactose'] == true && !meal.isLactoseFree)return false;
        if(_filters['vegan'] == true && !meal.isVegan)return false;
        if(_filters['vegetarian'] == true && !meal.isVegetarian)return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp Title placeholder',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                  fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
              headline3: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold)),
        ),
        routes: {
          '/': (ctx) => TabsPage(),
          CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(availableMeals: availableMeals),
          MealDetailPage.routeName: (ctx) => MealDetailPage(),
          FiltersPage.routeName: (ctx) => FiltersPage(setFilters: setFilters, filters: _filters)
        });
  }
}
