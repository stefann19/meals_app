import 'package:flutter/material.dart';
import 'package:max_guides/models/dummy_data.dart';
import 'package:max_guides/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  static const String routeName= '/meal-detail';



  @override
  Widget build(BuildContext context) {
    Meal meal = (ModalRoute.of(context)?.settings.arguments ?? DUMMY_MEALS.first) as Meal;

    Widget buildSectionTitle(String text){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Text(text, style:Theme.of(context).textTheme.headline3),
      );
    }
    Widget buildSection({required Widget child}){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        height: 200,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildSection(child:ListView.builder(
              itemBuilder: (ctx,index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10
                  ),
                  child: Text(meal.ingredients[index]),
                ),
              ),
              itemCount: meal.ingredients.length,
            )),
            buildSectionTitle('Steps'),
            buildSection(child:ListView.builder(
              itemBuilder: (ctx,index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index+1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider()
                ],
              ),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(meal.id);
        },
      ),
    );
  }
}
