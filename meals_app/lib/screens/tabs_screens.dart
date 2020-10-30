import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'}
  ];
  int _selectedPageIndex = 0;

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
