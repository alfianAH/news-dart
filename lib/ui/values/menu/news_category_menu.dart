import 'package:flutter/material.dart';

class NewsCategoryMenu{
  String categoryName;
  IconData categoryIcon;

  NewsCategoryMenu({
    required this.categoryName,
    required this.categoryIcon,
  });
}

var newsCategoryMenuList = [
  NewsCategoryMenu(
    categoryName: 'Kategori',
    categoryIcon: Icons.category_rounded
  )
];