import 'package:flutter/material.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';

class MenuItem extends StatelessWidget{
  final NewsCategoryMenu newsCategoryMenu;

  MenuItem({required this.newsCategoryMenu});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      child: InkWell(
        onTap: (){},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              children: [
                // Menu Icon
                Icon(newsCategoryMenu.categoryIcon),

                SizedBox(width: 8),

                // Menu name
                Text(
                  newsCategoryMenu.categoryName,
                  style: textTheme.headline3,
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

}