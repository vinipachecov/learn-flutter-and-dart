import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabsScreen(this._favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget._favoriteMeals),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /**
     * Length is the number of tabs
     */
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text('Favorites'))
          ]),
    );
  }
  //   /**
  //    * Length is the number of tabs
  //    */
  //   return DefaultTabController(
  //       length: 2,
  //       // initialIndex: 0,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: Text('Meals'),
  //           bottom: TabBar(
  //             tabs: [
  //               Tab(
  //                 icon: Icon(Icons.category),
  //                 text: 'Categories',
  //               ),
  //               Tab(
  //                 icon: Icon(Icons.star),
  //                 text: 'Favorites',
  //               )
  //             ],
  //           ),
  //         ),
  //         body: TabBarView(
  //           children: [CategoriesScreen(), FavoritesScreen()],
  //         ),
  //       ));
  // }
}
