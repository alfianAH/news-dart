import 'package:flutter/material.dart';

class NewsCategory{
  String categoryName;
  IconData categoryIcon;

  NewsCategory({
    required this.categoryName,
    required this.categoryIcon
  });
}

var newsCategoryList = [
  // Business / bisnis
  NewsCategory(
    categoryName: 'Bisnis',
    categoryIcon: Icons.business_rounded
  ),

  // Entertainment / hiburan
  NewsCategory(
    categoryName: 'Hiburan',
    categoryIcon: Icons.sports_esports_rounded
  ),

  // Health / kesehatan
  NewsCategory(
    categoryName: 'Kesehatan',
    categoryIcon: Icons.health_and_safety_rounded
  ),

  // Sports / olahraga
  NewsCategory(
    categoryName: 'Olahraga',
    categoryIcon: Icons.sports_rounded
  ),

  // Science / sains
  NewsCategory(
    categoryName: 'Sains',
    categoryIcon: Icons.science_rounded
  ),

  // Technology / Teknologi
  NewsCategory(
    categoryName: 'Teknologi',
    categoryIcon: Icons.precision_manufacturing_rounded
  ),
];