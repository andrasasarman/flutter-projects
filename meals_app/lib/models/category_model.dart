import 'package:flutter/material.dart';

class CategoryModel {
  ///
  /// Unique identifier
  ///
  final String id;

  ///
  /// Name of category
  ///
  final String title;

  ///
  /// Background color
  ///
  final Color color;

  CategoryModel({required this.id, required this.title, required this.color});
}
