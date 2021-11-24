import 'dart:html';

import 'package:flutter/material.dart';
import 'package:max_guides/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key,required this.meal}) : super(key: key);
  final Meal meal;
  void selectMeal(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)
                  ),
                  child: Image.network(meal.imageUrl, height: 256, width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(
                  child: Container(
                    width: 256,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 32,
                  right: 0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 8,),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 8,),
                      Text(meal.complexity.toShortString())
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 8,),
                      Text(meal.affordability.toShortString())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}