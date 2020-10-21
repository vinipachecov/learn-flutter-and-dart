import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getting meal id out of arguments passed to this screen
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal $mealId"),
      ),
      body: Center(
        child: Text("meal id = $mealId"),
      ),
    );
  }
}
