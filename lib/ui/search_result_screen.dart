import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/news_list.dart';
import 'package:news_app/ui/values/constants/constants.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatelessWidget{

  final String searchText;

  SearchResultScreen({
    required this.searchText
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: 'Hasil Pencarian',
      ),

      body: FutureBuilder<Response<NewsModel>>(
        future: Provider.of<NewsService>(context).getNewsBySearch(searchText, apiKey),
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

            // If news response is null, return no result text
            if(newsResponse == null) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Tidak ada hasil',
                  style: textTheme.bodyText1,
                ),
              );
            }

            // If the results greater than 0, return news list
            if (newsResponse.totalResults! > 0) {
              return NewsList(
                newsModel: newsResponse,
                listTitle: 'Pencarian anda "$searchText"',
                isFromSearch: true,
              );
            } else { // Else, return text
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Total berita: 0',
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