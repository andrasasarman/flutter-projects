import 'package:flutter/material.dart';
import 'package:meals_app/categories_and_meals.dart';

///
/// Meal page
/// Displays ingredients and steps about selected meal
///
class MealDetailScreen extends StatelessWidget {
  ///
  /// Approach that makes sure that I don't accidentally mistype the route
  /// identifier in one part
  ///
  static const routeName = '/meal-detail';

  ///
  /// Add to favorite function
  ///
  final Function toggleFavorite;

  ///
  /// Check if meal is added to favorites function
  ///
  final Function isFavorite;

  ///
  /// Main constructor
  ///
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  ///
  /// MealDetailScreen builder
  ///
  @override
  Widget build(BuildContext context) {
    ///
    /// Obtain the id pushed through the navigator arguments
    ///
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    ///
    /// Returns the first element that has the same id as in the sent arguments
    ///
    final selectedMeal = meals.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            _buildIngredientsSection(
                selectedMeal.ingredients, selectedMeal.ingredients.length),
            _buildStepsSection(selectedMeal.steps, selectedMeal.steps.length),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  ///
  /// Build steps section
  ///
  Widget _buildStepsSection(List<String> steps, int items) {
    return Column(
      children: [
        _buildSectionTitle('Steps'),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildContainer(
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${(index + 1)}'),
                    ),
                    title: Text(steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: items,
            ),
          ),
        ),
      ],
    );
  }

  ///
  /// Build ingredients section
  ///
  Widget _buildIngredientsSection(List<String> ingredients, int items) {
    return Column(
      children: [
        _buildSectionTitle('Ingredients'),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _buildContainer(
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).focusColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Text(
                    ingredients[index],
                    style: TextStyle(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ),
              itemCount: items,
            ),
          ),
        ),
      ],
    );
  }

  ///
  /// Build a container for separate information
  ///
  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      child: child,
    );
  }

  ///
  /// Build a title for every section
  ///
  Widget _buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Prompt', fontSize: 25),
        ),
      ),
    );
  }
}
