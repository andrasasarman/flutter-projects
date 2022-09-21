import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

///
/// A representation for every meal
///
class MealItem extends StatelessWidget {
  ///
  /// Unique identifier
  ///
  final String id;

  ///
  /// Meal title
  ///
  final String title;

  ///
  /// Meal image
  ///
  final String imageUrl;

  ///
  /// Duration for preparing
  ///
  final int duration;

  ///
  /// Meal complexity
  ///
  final Complexity complexity;

  ///
  /// Meal affordability
  ///
  final Affordability affordability;

  ///
  /// Main constructor
  ///
  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  ///
  /// Getter for returnig the complexity as a String
  ///
  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  ///
  /// Getter for returning the affordability as a String
  ///
  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  ///
  /// Push to the MealDetailScreen at onTap
  ///
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  ///
  /// MealItem builder
  ///
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                _buildMealImage(),
                _buildMealName(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoRow(context, Icons.schedule, '$duration min'),
                  _buildInfoRow(context, Icons.work, complexityText),
                  _buildInfoRow(context, Icons.money, affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Customize the meal image
  ///
  Widget _buildMealImage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: Image.network(
          imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  ///
  /// Build the meal name as a positioned widget
  ///
  Widget _buildMealName() {
    return Positioned(
      bottom: 35,
      right: 20,
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        color: Colors.black54,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontFamily: 'Quicksand'),
        ),
      ),
    );
  }

  ///
  /// Build a row with an important info together with an icon
  ///
  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).focusColor,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: TextStyle(color: Theme.of(context).focusColor),
        ),
      ],
    );
  }
}
