import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news/item/news_item_vertical.dart';
import 'package:news_app/ui/news/news_list.dart';

/// News list for search screen
class NewsListSearch extends StatelessWidget{
  final ScrollController scrollController;
  final TextTheme textTheme;
  final NewsList widget;

  NewsListSearch({
    required this.scrollController,
    required this.textTheme,
    required this.widget
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                widget.listTitle,
                style: textTheme.headline2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // News list
              Container(
                width: 600,
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    // Check image URL is null or not
                    Articles newsArticle = widget.newsModel.articles![index]!;

                    // If image URL is not null, show it on list
                    if(newsArticle.urlToImage != null ||
                        newsArticle.url != null) {
                      return NewsItemVertical(newsArticle: newsArticle);
                    } else { // Else, skip it
                      print('${newsArticle.title} has null url');
                      return SizedBox.shrink();
                    }
                  },
                  itemCount: widget.newsModel.articles!.length,
                ),
              ),
            ],
          ),
        )
    );
  }
}