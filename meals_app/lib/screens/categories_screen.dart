import 'package:flutter/material.dart';
import 'package:meals_app/categories_and_meals.dart';
import 'package:meals_app/widgets/category_item.dart';

///
/// Displays all categories in one screen
///
class CategoriesScreen extends StatelessWidget {
  ///
  /// Main constructor
  ///
  const CategoriesScreen({Key? key}) : super(key: key);

  ///
  /// CategoriesScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 120),
        children: categories
            .map((e) => CategoryItem(
                  title: e.title,
                  color: e.color,
                  id: e.id,
                ))
            .toList());
  }
}
