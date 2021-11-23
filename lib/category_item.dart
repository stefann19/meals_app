import 'package:flutter/material.dart';
import 'package:max_guides/category_meals_page.dart';
import 'package:max_guides/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;


  selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsPage.routeName,arguments: {'category':category});
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Text(category.title, style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
            color: category.backgroundColor,
            gradient: LinearGradient(
                colors: [category.backgroundColor.withOpacity(0.7), category.backgroundColor],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16)
        ),
      ),
    );
  }


}
