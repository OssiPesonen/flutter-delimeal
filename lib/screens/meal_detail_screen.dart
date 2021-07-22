import 'package:delimeal/dummy_data.dart';
import 'package:delimeal/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  Function toggleFavorite;

  MealDetailScreen(this.toggleFavorite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final Meal meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 0,
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          (index + 1).toString(),
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.star,
        ),
        onPressed: () {
          toggleFavorite(meal);
        },
      ),
    );
  }
}
