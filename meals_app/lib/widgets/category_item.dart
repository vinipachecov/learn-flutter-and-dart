import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {  
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // navigation using MaterialPageRoute
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(this.id, this.title);
    // }, ));

    // navigation using string named routes
    Navigator.of(ctx).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    // remember that using const improves rendering performance
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
         child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
              color.withOpacity(0.7),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}