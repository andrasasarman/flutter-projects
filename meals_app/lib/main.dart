import 'package:flutter/material.dart';
import 'package:meals_app/categories_and_meals.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MealsApp());
}

class MealsApp extends StatefulWidget {
  const MealsApp({Key? key}) : super(key: key);

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  ///
  ///
  ///
  List<Meal> _availableMeals = meals;

  ///
  ///
  ///
  List<Meal> _favouritedMeals = [];

  ///
  ///
  ///
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = meals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  ///
  ///
  ///
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favouritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouritedMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  ///
  ///
  ///
  bool _isMealFavorite(String id) {
    return _favouritedMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: const Color(0xffD61C4E),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        focusColor: const Color(0xffD61C4E),
        fontFamily: 'Prompt',
      ),
      routes: {
        '/': (context) => TabsScreen(_favouritedMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}
