import 'package:flutter/material.dart';
import 'package:meals_app/categories_and_meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

///
/// Displays all meals from a category
///
class CategoryMealsScreen extends StatefulWidget {
  ///
  /// Approach that makes sure that I don't accidentally mistype the route
  /// identifier in one part
  ///
  static const routeName = '/category-meals';

  ///
  /// Meals in category
  ///
  final List<Meal> availableMeals;

  ///
  /// Main constructor
  ///
  const CategoryMealsScreen(
    this.availableMeals, {
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  ///
  /// Category title
  ///
  String? categoryTitle = '';

  ///
  /// Meals in category
  ///
  List<Meal> displayedMeals = [];

  ///
  ///
  ///
  bool _loadedInitData = false;

  ///
  /// CategoryMealsScreen builder
  ///
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals =
          meals.where((meal) => meal.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  ///
  /// CategoryMealsScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
