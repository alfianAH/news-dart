import 'package:flutter/material.dart';
import 'package:news_app/ui/values/fonts/news_font.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: textTheme.headline1
        ),
      ),

      // Menu Drawer
      drawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index){
            final NewsCategoryMenu newsCategoryMenu = newsCategoryMenuList[index];

            return Container(
              child: InkWell(
                onTap: (){},

                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Menu Icon
                        Icon(newsCategoryMenu.categoryIcon),

                        // Menu name
                        Text(newsCategoryMenu.categoryName),
                      ],
                    ),
                  )
                ),
              ),
            );
          },
          itemCount: newsCategoryMenuList.length,
        ),
      ),

      body: Column(
        children: [
          Text(
            'Headline 1',
            style: textTheme.headline1,
          ),

          Text(
            'Headline 2',
            style: textTheme.headline2
          ),

          Text(
            'Headline 3',
            style: textTheme.headline3
          ),

          Text(
            'Body text 1',
            style: textTheme.bodyText1
          ),

          Text(
            'Body text 2',
            style: textTheme.bodyText2
          ),

          Text(
            'Subtitle 1',
            style: textTheme.subtitle1
          ),

          Text(
            'Subtitle 2',
            style: textTheme.subtitle2
          ),
        ],
      ),
    );
  }
}