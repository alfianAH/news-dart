import 'package:flutter/material.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/fonts/news_font.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: TextStyle(
            fontWeight: NewsFonts.semiBold
          ),
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

      body: Text('News app'),
    );
  }
}