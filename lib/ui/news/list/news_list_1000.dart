import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news/item/news_item_horizontal.dart';
import 'package:news_app/ui/news/item/news_item_vertical.dart';
import 'package:news_app/ui/news/news_list.dart';

/// News List in width > 600
class NewsList1000 extends StatefulWidget{
  final ScrollController scrollController;
  final TextTheme textTheme;
  final NewsList widget;
  final int itemCount;

  NewsList1000({
    required this.scrollController,
    required this.textTheme,
    required this.widget,
    required this.itemCount,
  });

  @override
  _NewsList1000State createState() => _NewsList1000State();
}

class _NewsList1000State extends State<NewsList1000> {
  final ScrollController _horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: widget.scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                widget.widget.listTitle,
                style: widget.textTheme.headline2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // News list horizontal
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _horizontalScrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    // Check image URL is null or not
                    Articles newsArticle = widget.widget.newsModel.articles![index]!;

                    // If image URL is not null, show it on list
                    if(newsArticle.urlToImage != null ||
                        newsArticle.url != null) {
                      return NewsItemHorizontal(
                          newsArticle: newsArticle
                      );
                    } else { // Else, skip it
                      print('${newsArticle.title} has null url');
                      return SizedBox.shrink();
                    }
                  },
                  itemCount: widget.itemCount,
                ),
              ),

              // News list vertical
              Container(
                width: 600,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: widget.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    // Check image URL is null or not
                    Articles newsArticle = widget.widget.newsModel.articles![index + widget.itemCount]!;

                    // If image URL is not null, show it on list
                    if(newsArticle.urlToImage != null ||
                        newsArticle.url != null) {
                      return NewsItemVertical(
                          newsArticle: newsArticle
                      );
                    } else { // Else, skip it
                      print('${newsArticle.title} has null url');
                      return SizedBox.shrink();
                    }
                  },
                  itemCount: widget.widget.newsModel.articles!.length - widget.itemCount,
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }
}