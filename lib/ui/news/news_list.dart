import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news/news_item.dart';

class NewsList extends StatefulWidget{
  final NewsModel newsModel;
  final String listTitle;
  final bool isFromSearch;

  NewsList({
    required this.newsModel,
    required this.listTitle,
    required this.isFromSearch
  });

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints){
        // Check wheter is from search screen or not
        // If from search screen, show specified news list
        if(widget.isFromSearch){
          return _NewsListSearch(
            scrollController: _scrollController,
            textTheme: textTheme,
            widget: widget,
          );
        } else{ // Else, show original news list
          // Check max width
          if(constraints.maxWidth <= 600){
            return _NewsList600(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
            );
          } else if(constraints.maxWidth <= 1000){
            return _NewsList1000(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
              itemCount: 3
            );
          } else{
            return _NewsList1000(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
              itemCount: 5
            );
          }
        }
      }
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

/// News list for search screen
class _NewsListSearch extends StatelessWidget{
  final ScrollController scrollController;
  final TextTheme textTheme;
  final NewsList widget;

  _NewsListSearch({
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

/// News List in width <= 600
class _NewsList600 extends StatelessWidget{
  final ScrollController scrollController;
  final TextTheme textTheme;
  final NewsList widget;

  _NewsList600({
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
            ListView.builder(
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
          ],
        ),
      )
    );
  }
}

/// News List in width > 600
class _NewsList1000 extends StatefulWidget{
  final ScrollController scrollController;
  final TextTheme textTheme;
  final NewsList widget;
  final int itemCount;

  _NewsList1000({
    required this.scrollController,
    required this.textTheme,
    required this.widget,
    required this.itemCount,
  });

  @override
  _NewsList1000State createState() => _NewsList1000State();
}

class _NewsList1000State extends State<_NewsList1000> {
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