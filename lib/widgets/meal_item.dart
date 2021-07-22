import 'package:delimeal/models/meal.dart';
import 'package:delimeal/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
    @required this.removeItem,
  });

  String get complexityText {
    var complexityLabel = '';

    if (complexity == Complexity.Simple) {
      complexityLabel = 'Simple';
    } else if (complexity == Complexity.Challenging) {
      complexityLabel = 'Challenging';
    } else if (complexity == Complexity.Hard) {
      complexityLabel = 'Hard';
    }

    return complexityLabel;
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return '';
    }
  }

  void selectMeal(context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((value) {
      removeItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 260,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black54,
                    width: 220,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 8),
                      Text('$duration min')
                    ],
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 8),
                      Text(complexityText)
                    ],
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text(affordabilityText)
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
