import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/news_list.dart';
import 'package:news_app/ui/values/constants/constants.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget{

  final String categoryTitle;
  final String categoryId;

  CategoryDetailScreen({
    required this.categoryTitle,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: categoryTitle,
      ),

      body: FutureBuilder<Response<NewsModel>>(
        future: Provider.of<NewsService>(context).getNewsByCategory(categoryId, apiKey),
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

            // If the results greater than 0, return news list
            if(newsResponse.totalResults! > 0) {
              return NewsList(
                newsModel: newsResponse,
                listTitle: 'Berita Utama',
              );
            } else{ // Else, return text
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Tidak ada hasil',
                  style: textTheme.bodyText1,
                ),
              );
            }

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