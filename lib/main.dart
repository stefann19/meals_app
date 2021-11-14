import 'package:flutter/material.dart';
import 'package:max_guides/categories_page.dart';

void main() =>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp Title placeholder',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const CategoriesPage(),
    );
  }
}
