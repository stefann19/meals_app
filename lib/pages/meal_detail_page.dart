import 'package:flutter/material.dart';
import 'package:max_guides/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  static const String routeName= '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Text('Ingredients', style:Theme.of(context).textTheme.headline3),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            height: 200,
            width: 300,
            child: ListView.builder(
              itemBuilder: (ctx,index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(meal.ingredients[index]),
                ),
              ),
              itemCount: meal.ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}
