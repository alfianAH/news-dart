import 'package:flutter/material.dart';

class NewsCategory{
  String categoryName;
  String categoryId;
  IconData categoryIcon;

  NewsCategory({
    required this.categoryName,
    required this.categoryId,
    required this.categoryIcon
  });
}

var newsCategoryList = [
  // Business / bisnis
  NewsCategory(
    categoryName: 'Bisnis',
    categoryId: 'business',
    categoryIcon: Icons.business_rounded
  ),

  // Entertainment / hiburan
  NewsCategory(
    categoryName: 'Hiburan',
    categoryId: 'entertainment',
    categoryIcon: Icons.sports_esports_rounded
  ),

  // Health / kesehatan
  NewsCategory(
    categoryName: 'Kesehatan',
    categoryId: 'health',
    categoryIcon: Icons.health_and_safety_rounded
  ),

  // Sports / olahraga
  NewsCategory(
    categoryName: 'Olahraga',
    categoryId: 'sports',
    categoryIcon: Icons.sports_rounded
  ),

  // Science / sains
  NewsCategory(
    categoryName: 'Sains',
    categoryId: 'science',
    categoryIcon: Icons.science_rounded
  ),

  // Technology / Teknologi
  NewsCategory(
    categoryName: 'Teknologi',
    categoryId: 'technology',
    categoryIcon: Icons.precision_manufacturing_rounded
  ),
];