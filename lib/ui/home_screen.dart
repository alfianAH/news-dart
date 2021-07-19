import 'package:flutter/material.dart';
import 'package:news_app/ui/menu_item.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Drawer Header
                  Container(
                    height: AppBar().preferredSize.height,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: NewsColors.primaryColor
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16
                      ),
                      margin: const EdgeInsets.all(0),
                      child: Text(
                        'Menu',
                        style: textTheme.headline1,
                      ),
                    )
                  ),

                  // Menu items
                  MenuItem(newsCategoryMenu: newsCategoryMenu),
                ],
              ),
            );
          },
          itemCount: newsCategoryMenuList.length,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Berita Utama',
                style: textTheme.headline2,
              ),

              // News list
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return NewsItem();
                },
                itemCount: 5,
              ),
            ],
          ),
        )
      ),
    );
  }
}