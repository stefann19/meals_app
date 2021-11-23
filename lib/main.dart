import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_guides/categories_page.dart';
import 'package:max_guides/category_meals_page.dart';

void main() =>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Title placeholder',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(subtitle1: const TextStyle(fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)),
      ),
      home: const CategoriesPage(),
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage()
      }
    );
  }
}
