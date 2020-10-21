import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    // extracting data passed through navigation
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MealItem(
              id: categoryMeals[idx].id,
              title: categoryMeals[idx].title,
              affordability: categoryMeals[idx].affordability,
              complexity: categoryMeals[idx].complexity,
              duration: categoryMeals[idx].duration,
              imageUrl: categoryMeals[idx].imageUrl,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
