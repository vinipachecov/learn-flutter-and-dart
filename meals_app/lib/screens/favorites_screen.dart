import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Container(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return ListView.builder(
      itemBuilder: (ctx, idx) {
        return MealItem(
          id: _favoriteMeals[idx].id,
          title: _favoriteMeals[idx].title,
          affordability: _favoriteMeals[idx].affordability,
          complexity: _favoriteMeals[idx].complexity,
          duration: _favoriteMeals[idx].duration,
          imageUrl: _favoriteMeals[idx].imageUrl,
        );
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
