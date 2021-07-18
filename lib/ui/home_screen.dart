import 'package:flutter/material.dart';
import 'package:news_app/ui/news_item.dart';
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
              padding: EdgeInsets.only(right: 16, top: 16, bottom: 16),
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