import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'Page': CategoriesScreen(), 'title': "Categories"},
      {'Page': FavoriteScreen(widget.favoriteMeals), 'title': "Your Favorites"},
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
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),

        //   bottom: TabBar(
        //     tabs: [
        //       Tab(
        //         icon: Icon(Icons.category),
        //         text: 'Categories',
        //       ),
        //       Tab(
        //         icon: Icon(Icons.star),
        //         text: 'Favorite',
        //       )
        //     ],
        //   ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),

      //  TabBarView(
      //   children: [CategoriesScreen(), FavoriteScreen()],
      // ),
    );
  }
}
