import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';

import 'favorites_screen.dart';

///
/// Creates separate tabs for categories and favourites screens
///
class TabsScreen extends StatefulWidget {
  ///
  /// All favorites meals list
  ///
  final List<Meal> favouriteMeals;

  ///
  /// Main constructor
  ///
  const TabsScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  ///
  /// TabsScreen Builder
  ///
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CategoriesScreen(),
            FavoritesScreen(widget.favouriteMeals),
          ],
        ),
      ),
    );
  }
}
