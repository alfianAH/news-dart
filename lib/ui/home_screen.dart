import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/menu_item.dart';
import 'package:news_app/ui/news_item.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/constants/constants.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';
import 'package:provider/provider.dart';

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

      body: FutureBuilder<Response<NewsModel>>(
        future: Provider.of<NewsService>(context).getNews(apiKey),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: textTheme.bodyText1,
                ),
              );
            }

            final newsResponse = snapshot.data!.body;

            return SingleChildScrollView(
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
                          // Check image URL is null or not
                          Articles newsArticle = newsResponse.articles![index]!;

                          // If image URL is not null, show it on list
                          if(newsArticle.urlToImage != null ||
                              newsArticle.url != null) {
                            return NewsItem(newsArticle: newsResponse.articles![index]!);
                          } else { // Else, skip it
                            print('${newsArticle.title} has null url');
                            return SizedBox.shrink();
                          }
                        },
                        itemCount: newsResponse.articles!.length,
                      ),
                    ],
                  ),
                )
            );
          } else{
            // Show loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}