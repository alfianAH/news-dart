import 'package:flutter/material.dart';
import 'package:news_app/ui/category/category_screen.dart';

class NewsCategoryMenu{
  String categoryName;
  IconData categoryIcon;
  var categoryDestination;

  NewsCategoryMenu({
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryDestination
  });
}

var newsCategoryMenuList = [
  NewsCategoryMenu(
    categoryName: 'Kategori',
    categoryIcon: Icons.category_rounded,
    categoryDestination: CategoryScreen()
  )
];