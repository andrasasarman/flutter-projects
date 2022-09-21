enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  ///
  /// Unique identifier
  ///
  final String id;

  ///
  /// Every meal should be part of one or more categories
  ///
  final List<String> categories;

  ///
  /// Name of meal
  ///
  final String title;

  ///
  /// I'll use a network image
  ///
  final String imageUrl;

  ///
  /// List of ingredients names
  ///
  final List<String> ingredients;

  ///
  /// Steps that describes creating the meal
  ///
  final List<String> steps;

  ///
  /// How long this meal take to prepare
  ///
  final int duration;

  ///
  /// Describes the complexity of our meal
  ///
  final Complexity complexity;

  ///
  /// Describes the affordability of our meal
  ///
  final Affordability affordability;

  ///
  ///
  ///
  final bool isGlutenFree;

  ///
  ///
  ///
  final bool isLactoseFree;

  ///
  ///
  ///
  final bool isVegan;

  ///
  ///
  ///
  final bool isVegetarian;

  ///
  ///
  ///

  ///
  ///
  ///
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
