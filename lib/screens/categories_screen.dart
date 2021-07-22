import 'package:delimeal/widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 3 / 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (category) => CategoryItem(
                id: category.id,
                color: category.color,
                title: category.title,
              ),
            )
            .toList(),
      ),
    );
  }
}
