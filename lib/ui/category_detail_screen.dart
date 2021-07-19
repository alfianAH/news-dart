import 'package:flutter/material.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/menu_item.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';

class CategoryDetailScreen extends StatelessWidget{

  final String categoryTitle;

  CategoryDetailScreen({required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: categoryTitle,
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