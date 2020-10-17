import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DeliMeal")),
      body: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(catData.id,catData.title, catData.color))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
