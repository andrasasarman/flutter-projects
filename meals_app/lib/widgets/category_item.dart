import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

///
/// A card representation for every category
///
class CategoryItem extends StatelessWidget {
  ///
  /// Category name
  ///
  final String title;

  ///
  /// Background color
  ///
  final Color color;

  ///
  /// Unique identifier
  ///
  final String id;

  ///
  /// Main constructor
  ///
  const CategoryItem(
      {required this.title, required this.color, Key? key, required this.id})
      : super(key: key);

  ///
  /// Push the selected category screen at onTap
  ///
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  ///
  /// CategoryItem builder
  ///
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color.withOpacity(0.3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: 'Prompt',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
