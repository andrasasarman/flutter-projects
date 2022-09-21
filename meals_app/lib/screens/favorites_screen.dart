import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

///
/// Displays all favorites meals in one screen
///
class FavoritesScreen extends StatelessWidget {
  ///
  /// All favorites meals list
  ///
  final List<Meal> favoriteMeals;

  ///
  /// Main constructor
  ///
  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  ///
  /// FavoritesScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
