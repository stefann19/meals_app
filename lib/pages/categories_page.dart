import 'package:flutter/material.dart';
import 'package:max_guides/widgets/category_item.dart';
import 'package:max_guides/models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridDelegate = const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 64 * 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20);
    return Scaffold(
      appBar: AppBar(title: Text('Appbar title placeholder in categories page'),),
      body: GridView(
          padding: const EdgeInsets.all(32),
          children: DUMMY_CATEGORIES.map((categoryData) => CategoryItem(category: categoryData)).toList(),
          gridDelegate: gridDelegate
      ),
    );
  }
}
