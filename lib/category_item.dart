import 'package:flutter/material.dart';
import 'package:max_guides/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(category.title),
      decoration: BoxDecoration(
          color: category.backgroundColor,
          gradient: LinearGradient(
              colors: [category.backgroundColor.withOpacity(0.7), category.backgroundColor],
              begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16)
      ),
    );
  }
}
