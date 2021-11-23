import 'package:flutter/material.dart';
import 'package:max_guides/models/category.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String,Object>;
    final CategoryModel category = routeArgs['category'] as CategoryModel ;
    return Scaffold(
      appBar: AppBar(title: Text(category.title),),
      body: Center(
        child: Text(category.id),
      ),
    );
  }
}
